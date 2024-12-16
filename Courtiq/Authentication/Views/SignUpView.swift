//
//  SignUpView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-15.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI
import UserService

// MARK: - SignUpView

struct SignUpView: View {
    
    // MARK: - Properties
    
    @State private var emailStatus: RDTextField.RDTextFieldState = .normal
    @State private var passwordStatus: RDTextField.RDTextFieldState = .normal
    @State private var confirmPasswordStatus: RDTextField.RDTextFieldState = .normal
    @ObservedObject private var vm: AuthenticationVM
    
    private var isFormValid: Bool {
        return true
        // TODO: Fix the validator for the text field
    }

    // MARK: - Initializer
    
    init(vm: AuthenticationVM) {
        self.vm = vm
    }
    
    // MARK: - Body
    
    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Sign Up", leading: {
                Image.Token.Icons.back
                    .rdActionIcon {
                        vm.router.handle(action: .pop)
                    }
            }, trailing: {})
        } content: {
            VStack(spacing: 16) {
                Image("signUpImage")
                    .scaledToFit()
                    .padding(.vertical, 20)
                
                RDTextField(textFieldType: .primary,
                            placeholder: "Enter email",
                            leadingIcon: Image.Token.Icons.envelope,
                            value: $vm.email,
                            state: $emailStatus)
                
                RDTextField(textFieldType: .password,
                            placeholder: "Enter password",
                            leadingIcon: Image.Token.Icons.locked,
                            value: $vm.password,
                            state: $passwordStatus)
                
                RDTextField(textFieldType: .password,
                            placeholder: "Repeat password",
                            leadingIcon: Image.Token.Icons.locked,
                            value: $vm.confirmPassword,
                            state: $confirmPasswordStatus)
            }
        } footer: {
            VStack {
                RDButtonView(.small, .ghost, "Login to existing account.") {
                    vm.handle(action: .signInFromSignUp)
                }
                
                RDButtonView(.extraLarge, .primary, "Sign up", disable: !isFormValid) {
                    Task {
                        vm.handle(action: .signUpBtn)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
