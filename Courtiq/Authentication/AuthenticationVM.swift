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

// MARK: AuthenticationVM

final class AuthenticationVM: ViewModel {
    
    // MARK: Internal
    
    init(authService: any AuthServiceProtocol,
         userService: any UserServiceProtocol,
         router: AppRouter,
         storageService: any StorageServiceProtocol)
    {
        self.authService = authService
        self.userService = userService
        self.router = router
        self.storageService = storageService
    }
    
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
    
    func handle(action: AuthenticationVM.Actions) {
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
    
    // MARK: - Private Properties
    
    private var authService: any AuthServiceProtocol
    private var userService: any UserServiceProtocol
    private var storageService: any StorageServiceProtocol
    
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
        router.handle(action: .isLoading)
        do {
            let user = try await authService.signUp(email: email, password: password)
            await fetchCurrentUserAndUpdate(userID: user.uid)
            router.handle(action: .stopLoading)
        } catch {
            router.handle(action: .stopLoading)
            print(error.localizedDescription)
        }
    }
    
    private func fetchCurrentUserAndUpdate(userID: String) async {
        do {
            let currentUser = try await userService.fetchCurrentUser(userID: userID)
            await MainActor.run {
                self.user = currentUser
            }
            self.router.handle(action: .popToRoot)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func updateAdditionalInfo() async {
        router.handle(action: .isLoading)
        guard let userID = await authService.currentUser?.uid else {
            print("No user")
            router.handle(action: .isLoading)
            return
        }

        do {
            if let selectedItem = selectedItem {
                do {
                    let data = try await selectedItem.loadTransferable(type: Data.self)
                    if let imageData = data {
                        let path = "users/\(userID)/profile.jpg"
                        do {
                            _ = try await storageService.uploadData(imageData, to: path)
                        } catch {
                            print("Error uploading image: \(error.localizedDescription)")
                        }
                    }
                } catch {
                    print("Error loading image: \(error.localizedDescription)")
                }
            }

            try await userService.updateCurrentUser(userID: userID, data: user)
            await authService.setAdditionalInfoProvided()
            router.handle(action: .stopLoading)
            router.handle(action: .popToRoot)
        } catch {
            print(error.localizedDescription)
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
    }
}
