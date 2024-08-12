//
//  AuthenticationVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

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
    @Published var yearOfBirth: String = ""
    @Published var user: User = User(uid: "")
    @Published var selectedItem: PhotosPickerItem? = nil {
        didSet {
            if let selectedItem = selectedItem {
                Task {
                    await loadTransferable(from: selectedItem)
                }
            }
        }
    }
    @Published var selectedImage: Image? = nil
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
            let view = AnyView(AdditionalInfoView(vm: self))
            router.handle(action: .push(view))
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
        }
    }
    
    // MARK: - Private
    
    private var authService: any AuthServiceProtocol
    private var userService: any UserServiceProtocol
    private var storageService: any StorageServiceProtocol
    
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
            await fetchCurrentUserAndUpdate(userID: user.uid)
            await MainActor.run {
                router.handle(action: .stopLoading)
                router.handle(action: .popToRoot)
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
        do {
            let currentUser = try await userService.fetchCurrentUser(userID: userID)
            await MainActor.run {
                self.user = currentUser
                self.router.handle(action: .popToRoot)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    private func updateAdditionalInfo() async {
        await router.handle(action: .isLoading)
        guard let userID = await authService.currentUser?.uid else {
            await MainActor.run {
                print("No user")
                router.handle(action: .stopLoading)
            }
            return
        }

        do {
            if let selectedItem = selectedItem {
                if let data = try await selectedItem.loadTransferable(type: Data.self) {
                    do {
                        let url = try await storageService.uploadProfilePicture(data, for: userID).absoluteString
                        let imageUrls = constructImageUrls(baseUrl: url)

                        await MainActor.run {
                            self.user.imageUrls = imageUrls
                        }
                    } catch {
                        print("Error uploading image: \(error.localizedDescription)")
                    }
                }
            }

            user.uid = userID
            user.nationality = CountryManager.shared.getCountryCode(fromName: user.nationality) ?? ""
            try await userService.updateCurrentUser(userID: userID, data: user)
            await authService.setAdditionalInfoProvided()
            await MainActor.run {
                router.handle(action: .stopLoading)
                router.handle(action: .popToRoot)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func constructImageUrls(baseUrl: String) -> [ImageSize: ImageURL] {
        // Define the sizes and corresponding suffixes
        let sizes: [ImageSize: String] = [
            .small: "100x100",
            .medium: "200x200",
            .large: "400x400"
        ]

        // Construct URLs for each size
        var imageUrls: [ImageSize: ImageURL] = [:]

        for (size, suffix) in sizes {
            let newUrl = baseUrl.replacingOccurrences(of: "profile_picture.png", with: "profile_picture_\(suffix).png")
            imageUrls[size] = ImageURL(url: newUrl, size: size)
        }

        return imageUrls
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
    }
}
