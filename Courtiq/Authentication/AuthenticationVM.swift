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

// MARK: AuthenticationVM

final class AuthenticationVM: ViewModel {
    
    // MARK: Internal
    
    init(authService: any AuthServiceProtocol,
         userService: any UserServiceProtocol,
         router: AppRouter)
    {
        self.authService = authService
        self.userService = userService
        self.router = router
    }
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var firstName: String = ""
    @Published var user: User = User(uid: "")

    var router: AppRouter
    
    func onAppear() {
        print("Hello")
        
    }
    
    func onDisappear() {
        print("Hello")
        
    }
    
    @Published var selectedItem: PhotosPickerItem? = nil {
        didSet {
            if let selectedItem = selectedItem {
                Task {
                    await loadTransferable(from: selectedItem)
                }
            }
        }
    }
    @Published var selectedImage: UIImage? = nil

    func loadTransferable(from imageSelection: PhotosPickerItem?) async {
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self),
               let image = UIImage(data: data) {
                await MainActor.run {
                    self.selectedImage = image
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
            signIn(email: self.email, password: self.password)
        case .signUpBtn:
            signUp(email: self.email, password: self.password)
        case .updateAddInfoBtn:
            updateAdditionalInfo()
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
    
    private func signIn(email: String, password: String) {
        Task {
            do {
                try await authService.signIn(email: email, password: password)
                router.handle(action: .popToRoot)
            } catch {
                
                print(error.localizedDescription)
            }
        }
    }
    
    private func signUp(email: String, password: String) {
        Task {
            do {
                let user = try await authService.signUp(email: email, password: password)
                userService.fetchCurrentUser(userID: user.uid) { result in
                    switch result {
                    case .success(let user):
                        self.user = user
                        let view = NewUserInformationView(vm: self)
                        self.router.handle(action: .push(AnyView(view)))
                    case .failure(let failure):
                        print(failure)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func updateAdditionalInfo() {
        Task {
            if let userID = await authService.currentUser?.uid {
                userService.updateCurrentUser(userID: userID, data: user) { result in
                    switch result {
                    case .success(_):
                        self.router.handle(action: .popToRoot)
                        Task { @MainActor in
                            self.authService.toggleLoggedInState()
                        }
                    case .failure(let failure):
                        print(failure)
                    }
                }
            }
        }
    }

    
    private func resetPassword(email: String) {
        print(#function)
    }
    
    private func showForgotPassword() {
        print(#function)
    }
    
    private func showAddInfo() {
        print(#function)
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

// MARK: AuthenticationVM Steps

extension AuthenticationVM {
    
    // MARK: Steps
    enum Steps {
        case signInPage
        case signUpPage
        case additionalInformation
        case verifyEmail
        case start
    }
}

// MARK: Steps Views

extension AuthenticationVM.Steps {
    
    @ViewBuilder
    func view(with viewModel: AuthenticationVM) -> some View {
        switch self {
        case .signInPage:
            SignInView(vm: viewModel)
        case .signUpPage:
            SignUpView(vm: viewModel)
        case .additionalInformation:
            Text("Additional Information")
        case .verifyEmail:
            Text("Verify Email")
        case .start:
            AuthenticationWelcomeView(vm: viewModel)
        }
    }
}
