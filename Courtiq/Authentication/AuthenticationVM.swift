//
//  AuthenticationVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import AuthenticationService
import Foundation
import SwiftUI

// MARK: AuthenticationVM

final class AuthenticationVM: ViewModel {
    
    // MARK: Internal

    init(authService: any AuthServiceProtocol, router: AppRouter) {
        self.authService = authService
        self.router = router
    }

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    func onAppear() {
        print("Hello")

    }
    
    func onDisappear() {
        print("Hello")

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
            let view = AnyView(AdditionalInfoView())
            router.handle(action: .push(view))
        case .signInBtn:
            signIn(email: self.email, password: self.password)
        case .signUpBtn:
            signUp(email: self.email, password: self.password)
        case .updateAddInfoBtn:
            print("Update info pressed")
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
    var router: AppRouter

    private func signIn(email: String, password: String) {
        Task {
            do {
                try await authService.signIn(email: email, password: password)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func signUp(email: String, password: String) {
        Task {
            do {
                try await authService.signUp(email: email, password: password)
                
            } catch {
                print(error.localizedDescription)
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

// MARK: Steos Views

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
