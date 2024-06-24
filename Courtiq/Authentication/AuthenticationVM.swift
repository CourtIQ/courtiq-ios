//
//  AuthenticationVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import AuthenticationService
import Foundation

enum AuthenticationAction {
    case signIn
    case showSignIn
    case showSignUp
    case signUp
    case forgotPassword
    case showForgotPassword
    case showAddInfo
    case updateAddInfo
}

// MARK: AuthenticationVM

final class AuthenticationVM: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isUserLoggedIn: Bool = false
    var flow: FlowProvider

    // MARK: - Private Properties
    
    private var authService: any AuthServiceProtocol
    
    // MARK: - Initialization
    
    init(authService: any AuthServiceProtocol, flow: FlowProvider) {
        self.authService = authService
        self.flow = flow
        Task {
            let loggedInStatus = await authService.isUserLoggedIn
            DispatchQueue.main.async {
                self.isUserLoggedIn = loggedInStatus
            }
        }
    }
    
    // MARK: - Public Methods
    
    func handle(action: AuthenticationAction) {
        switch action {
        case .signIn:
            signIn(email: email, password: password)
        case .signUp:
            signUp(email: email, password: password)
        case .forgotPassword:
            print("Hello")
        case .updateAddInfo:
            print("Hello")
        case .showSignIn:
            flow.push(SignInView(vm: self))
        case .showSignUp:
            flow.push(SignUpView(vm: self))
        case .showForgotPassword:
            showForgotPassword()
        case .showAddInfo:
            showAddInfo()
        }
    }
    
    // MARK: - Private Methods
    
    private func signIn(email: String, password: String) {
        Task {
            do {
                try await authService.signIn(email: email, password: password)
                DispatchQueue.main.async {
                    self.isUserLoggedIn = self.authService.isUserLoggedIn
                    self.flow.replace([HomeView().environmentObject(self.flow)])
                }
            } catch {
                DispatchQueue.main.async {
                    self.flow.alert(Alert(title: "\(error.localizedDescription)"), animated: true)
                }
            }
        }
    }
    
    private func signUp(email: String, password: String) {
        Task {
            do {
                try await authService.signUp(email: email, password: password)
                DispatchQueue.main.async {
                    self.isUserLoggedIn = self.authService.isUserLoggedIn
                    self.flow.replace([HomeView().environmentObject(self.flow)])
                }
            } catch {
                DispatchQueue.main.async {
                    self.flow.alert(Alert(title: "\(error.localizedDescription)"), animated: true)
                }
            }
        }
    }
    
    private func showForgotPassword() {
        print(#function)
    }
    
    private func showAddInfo() {
        print(#function)
    }
}
