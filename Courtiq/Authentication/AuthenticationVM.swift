//
//  AuthenticationVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import AuthenticationService
import Foundation
import Models
import PhotosUI
import RDDesignSystem
import StorageService
import SwiftUI
import UserService
import LocationService

// MARK: - AuthenticationVM

@MainActor
final class AuthenticationVM: ViewModel {

    // MARK: - Dependencies

    @Dependency(\.authService) private var authService
    @Dependency(\.userService) private var userService

    // MARK: - Properties

    private let storageService: any StorageServiceProtocol
    private let locationManager = CourtIQLocationManager()
    private let googlePlaces = GooglePlacesService()
    
    let router: AppRouter

    // MARK: - Published Properties

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var selectedProfileImage: PhotosPickerItem? = nil {
        didSet {
            guard let selectedItem = selectedProfileImage else { return }
            Task {
                await loadTransferable(from: selectedItem)
            }
        }
    }
    @Published var selectedImage: Image? = nil
    @Published var isUsernameAvailable: Bool = false
    @Published var isUsernameAvailableText: String? = nil
    @Published var completeRegistrationInput = CompleteUserRegistrationFormModel()
    
    @Published var citiesMenuList: [DropdownItem] = []

    // MARK: - Computed Properties

    var countriesMenuList: [DropdownItem] = []

    // MARK: - Lifecycle

    init(
        router: AppRouter,
        storageService: any StorageServiceProtocol
    ) {
        self.router = router
        self.storageService = storageService
        self.countriesMenuList = CountryManager.shared
            .getAllCountries()
            .compactMap { country in
                guard let image = CountryManager.shared.getCountryFlagImage(fromCode: country.code) else {
                    return nil
                }
                return DropdownItem(image: image, title: country.name)
            }
    }

    // MARK: - View Events

    func onAppear() {

    }

    func onDisappear() {
        // Implement any onDisappear logic here
    }

    // MARK: - Action Handler

    func handle(action: Actions) {
        switch action {
        case .goToSignIn:
            let view = SignInView(vm: self)
            router.handle(action: .push(AnyView(view)))
        case .goToSignUp:
            let view = SignUpView(vm: self)
            router.handle(action: .push(AnyView(view)))
        case .goToFrgtPswd:
            let view = AnyView(ForgotPasswordView(vm: self))
            router.handle(action: .showHalfSheet(view, detents: [.medium]))
        case .goToAddInfo:
            if authService.isUserLoggedIn && authService.additionalInfoRequired {
                let view = AnyView(AdditionalInfoView(vm: self))
                router.handle(action: .push(view))
            }
        case .continueWithGoogleBtn:
            Task {
                await signInWithGoogle()
            }
        case .signInBtn:
            Task {
                await signIn(email: self.email, password: self.password)
            }
        case .signUpBtn:
            Task {
                await signUp(email: self.email, password: self.password)
            }
        case .updateAddInfoBtn:
            Task {
                await updateAdditionalInfo()
            }
        case .frgtPswdBtn:
            print("Forgot Button")
        case .signInFromSignUp:
            router.handle(action: .popToRoot)
            let view = AnyView(SignInView(vm: self))
            router.handle(action: .push(view))
        case .signUpFromSignIn:
            router.handle(action: .popToRoot)
            let view = AnyView(SignUpView(vm: self))
            router.handle(action: .push(view))
        case .usernameValueChanged(let username):
            handleUsernameChanged(username)
        case .searchForCities(let city):
            searchForCities(city)
        }
    }

    // MARK: - Public Methods

    func loadTransferable(from imageSelection: PhotosPickerItem?) async {
        do {
            guard
                let data = try await imageSelection?.loadTransferable(type: Data.self),
                let uiImage = UIImage(data: data)
            else {
                return
            }
            self.selectedImage = Image(uiImage: uiImage)
        } catch {
            print("Error loading image: \(error.localizedDescription)")
        }
    }

    func printIDToken() async {
        do {
            let token = try await authService.getIDToken()
            // Do something with the token if needed
        } catch {
            router.handle(action: .stopLoading)
            print(error.localizedDescription)
        }
    }

    // MARK: - Private Methods

    private func signIn(email: String, password: String) async {
        router.handle(action: .isLoading)
        do {
            try await authService.signIn(email: email, password: password)
            router.handle(action: .stopLoading)
            router.handle(action: .popToRoot)
        } catch {
            router.handle(action: .stopLoading)
            print(error.localizedDescription)
        }
    }

    private func signUp(email: String, password: String) async {
        await router.handle(action: .isLoading)
        do {
            let user = try await authService.signUp(email: email, password: password)
            await MainActor.run {
                router.handle(action: .stopLoading)
                self.handle(action: .goToAddInfo)
            }
        } catch {
            await MainActor.run {
                router.handle(action: .stopLoading)
                router.handle(action: .popToRoot)
                print(error.localizedDescription)
            }
        }
    }

    private func fetchCurrentUserAndUpdate(userID: String) async {
        // Implement logic to fetch and update current user by userID
        print("fetchCurrentUserAndUpdate")
    }
    
    private func signInWithGoogle() async {
        router.handle(action: .isLoading)
        do {
            let user = try await authService.signInWithGoogle()
            await MainActor.run {
                router.handle(action: .stopLoading)
                self.handle(action: .goToAddInfo)
            }
        } catch {
            print("\(error.localizedDescription)")
            router.handle(action: .stopLoading)

        }
    }

    private func updateAdditionalInfo() async {
        router.handle(action: .isLoading)
        do {
            let user = completeRegistrationInput.toUpdateUserInput()
            print(user)
            try await userService.completeRegistration(user)
            await authService.setAdditionalInfoProvided()
            router.handle(action: .popToRoot)
            router.handle(action: .stopLoading)
        } catch {
            print("Error updating document: \(error.localizedDescription)")
        }
    }
    

    private func handleUsernameChanged(_ username: String) {
        Task {
            do {
                let isAvailable = try await userService.isUsernameAvailable(username)
                if isAvailable {
                    isUsernameAvailableText = "Username is available"
                    isUsernameAvailable = true
                    print("Username is available")
                } else {
                    print("Username not available")
                    isUsernameAvailableText = "Username is not available. Choose a different one."
                    isUsernameAvailable = false
                }
            } catch {
                print("Error checking username availability: \(error.localizedDescription)")
            }
        }
    }

    private func resetPassword(email: String) {
        // Implement reset password logic
    }

    private func showForgotPassword() {
        // Implement show forgot password logic
    }

    private func showAddInfo() {
        // Implement show add info logic
    }
    
    private func searchForCities(_ query: String) {
        guard query.count >= 1 else {
            citiesMenuList = []
            return
        }
        Task {
            do {
                let (lat, lng) = try await locationManager.fetchCurrentCoordinate()
                let radius = 50000
                
                let autocompleteResults = try await googlePlaces.autocompleteCities(
                    query: query,
                    coordinate: (lat, lng),
                    radius: radius
                )
                let dropdownItems = autocompleteResults.map { result in
                    DropdownItem(
                        image: Image.Token.Icons.map,
                        title: "\(result.primaryText), \(result.secondaryText)"
                    )
                }
                self.citiesMenuList = dropdownItems
            } catch {
                print("Error searching for cities: \(error)")

            }
        }
        
    }
}

// MARK: - AuthenticationVM.Actions

extension AuthenticationVM {
    enum Actions {
        case goToSignIn
        case goToSignUp
        case goToFrgtPswd
        case goToAddInfo
        case continueWithGoogleBtn
        case signInBtn
        case signUpBtn
        case updateAddInfoBtn
        case frgtPswdBtn
        case signInFromSignUp
        case signUpFromSignIn
        case usernameValueChanged(String)
        case searchForCities(String)
    }
}
