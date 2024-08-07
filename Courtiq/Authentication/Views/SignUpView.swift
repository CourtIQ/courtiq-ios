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

    private var navigationParams: RDTopNavigationParams {
        RDTopNavigationParams(
            type: .primary,
            title: "Sign Up",
            leadingItem: (
                leadingItemType: .tertiary,
                leadingItemIcon: Image(systemName: "chevron.left"),
                leadingItemAction: {
                    vm.router.handle(action: .pop)
                }
            )
        )
    }

    // MARK: - Initializer
    
    init(vm: AuthenticationVM) {
        self.vm = vm
    }
    
    // MARK: - Body
    
    var body: some View {
        MarqueeView {
            RDTopNavigationBar(
                params: navigationParams
            )
        } content: {
            VStack(spacing: 16) {
                Image("signUpImage")
                    .scaledToFit()
                    .padding(.vertical, 20)
                
                RDTextField(textFieldType: .primary,
                            placeholder: "Enter email",
                            icon: (leadingIcon: Image.Token.Icons.envelope, trailingIcon: nil),
                            value: $vm.email,
                            state: $emailStatus)
                
                RDTextField(textFieldType: .password,
                            placeholder: "Enter password",
                            icon: (leadingIcon: Image.Token.Icons.locked, trailingIcon: nil),
                            value: $vm.password,
                            state: $passwordStatus)
                
                RDTextField(textFieldType: .password,
                            placeholder: "Repeat password",
                            icon: (leadingIcon: Image.Token.Icons.envelope, trailingIcon: nil),
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
