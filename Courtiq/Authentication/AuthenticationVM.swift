//
//  AuthenticationVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import Models
import AuthenticationService
import UserService
import Foundation
import SwiftUI
import PhotosUI
import StorageService
import RDDesignSystem

// MARK: - AuthenticationVM

final class AuthenticationVM: ViewModel {
    
    // MARK: Lifecycle
    
    init(authService: any AuthServiceProtocol,
         userService: any UserServiceProtocol,
         router: AppRouter,
         storageService: any StorageServiceProtocol)
    {
        self.authService = authService
        self.userService = userService
        self.router = router
        self.storageService = storageService
        self.countriesMenuList = CountryManager.shared.getAllCountries().compactMap { country in
            if let image = CountryManager.shared.getCountryFlagImage(fromCode: country.code) {
                return DropdownItem(image: image, title: country.name)
            } else {
                return nil
            }
        }
    }
    
    // MARK: - Internal
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var selectedProfileImage: PhotosPickerItem? = nil {
        didSet {
            if let selectedItem = selectedProfileImage {
                Task {
                    await loadTransferable(from: selectedItem)
                }
            }
        }
    }
    @Published var selectedImage: Image? = nil
    @Published var isUsernameAvailable: Bool = false
    @Published var isUsernameAvailableText: String? = nil
    @Published var updateUser = CompleteRegistrationUser()
    
    var countriesMenuList: [DropdownItem] = []

    var router: AppRouter
    
    func onAppear() {
    }
    
    func onDisappear() {
    }

    func loadTransferable(from imageSelection: PhotosPickerItem?) async {
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                await MainActor.run {
                    self.selectedImage = Image(uiImage: uiImage)
                }
            }
        } catch {
            print("Error loading image: \(error.localizedDescription)")
        }
    }
    
    // MARK: Action Handler
    
    @MainActor func handle(action: AuthenticationVM.Actions) {
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
        }
    }
    
    // MARK: - Private
    
    private var authService: any AuthServiceProtocol
    private var userService: any UserServiceProtocol
    private var storageService: any StorageServiceProtocol
    
    func printIDToken() async {
        do {
            let token = try await authService.getIDToken()
        } catch {
            await MainActor.run {
                router.handle(action: .stopLoading)
                print(error.localizedDescription)
            }
        }
    }
    private func signIn(email: String, password: String) async {
        await router.handle(action: .isLoading)
        do {
            try await authService.signIn(email: email, password: password)
            await MainActor.run {
                router.handle(action: .stopLoading)
                router.handle(action: .popToRoot)
            }
        } catch {
            await MainActor.run {
                router.handle(action: .stopLoading)
                print(error.localizedDescription)
            }
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
        print("fetchCurrentUserAndUpdate")
    }

    private func updateAdditionalInfo() async {
        Task {
            await router.handle(action: .isLoading)
            do {
                print(self.updateUser)
                try await userService.completeRegistration(self.updateUser)
                await authService.setAdditionalInfoProvided()
                await MainActor.run {
                    router.handle(action: .popToRoot)
                    router.handle(action: .stopLoading)
                }
            } catch {
                print("Error updating document: \(error.localizedDescription)")
            }
            
        }

    }

    private func handleUsernameChanged(_ username: String) {
        Task {
            do {
                let isAvailable = try await userService.isUsernameAvailable(username)
                await MainActor.run {
                    if isAvailable {
                        self.isUsernameAvailableText = "Username is available"
                        self.isUsernameAvailable = true
                        print("Username is available")
                    } else {
                        print("Username not available")
                        self.isUsernameAvailableText = "Username is not available. Choose a different one."
                        self.isUsernameAvailable = false
                    }
                }
            } catch {
                print("Error checking username availability: \(error.localizedDescription)")
            }
        }
    }

    private func resetPassword(email: String) {
    }
    
    private func showForgotPassword() {
    }
    
    private func showAddInfo() {
    }
}

// MARK: AuthenticationVM Actions

extension AuthenticationVM {

    // MARK: Actions
    enum Actions {
        case goToSignIn
        case goToSignUp
        case goToFrgtPswd
        case goToAddInfo
        case signInBtn
        case signUpBtn
        case updateAddInfoBtn
        case frgtPswdBtn
        case signInFromSignUp
        case signUpFromSignIn
        case usernameValueChanged(String)
    }
}
