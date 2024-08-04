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

// MARK: SignUpView

struct SignUpView: View {
    
    // MARK: Internal
    
    init(vm: AuthenticationVM) {
        self.vm = vm
    }

    // MARK: - Body
    
    var body: some View {
        MarqueeView {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Sign Up",
                    leadingItem: AnyView(
                        RDIconButton(.tertiary, .small, Image(systemName: "chevron.left"), action: {
                            vm.router.handle(action: .pop)
                        })
                    ),
                    bgColor: .white
                )
            )
        } content: {
            VStack(spacing: 16) {
                Image("signUpImage")
                    .scaledToFit()
                    .padding(.vertical, 20)
                RDTextField(
                    params: RDTextFieldParams(type: .primary, placeholder: "Enter email"),
                    text: $vm.email,
                    status: $emailStatus,
                    validationType: .email
                )
                RDTextField(
                    params: RDTextFieldParams(type: .password, placeholder: "Enter password"),
                    text: $vm.password,
                    status: $passwordStatus,
                    validationType: .password
                )
                RDTextField(
                    params: RDTextFieldParams(type: .password, placeholder: "Confirm password"),
                    text: $vm.confirmPassword,
                    status: $confirmPasswordStatus,
                    validationType: .password
                )
            }
        } footer: {
            RDButtonView(.small, .ghost, "Login to existing account.") {
                vm.handle(action: .signInFromSignUp)
            }
            
            RDButtonView(.extraLarge, .primary, "Sign up",
                         disable: !isFormValid) {
                Task {
                    vm.handle(action: .signUpBtn)
                }
            }

        }
    }
    
    // MARK: - Private
    
    @State private var emailStatus: RDTextFieldStatus = .none
    @State private var passwordStatus: RDTextFieldStatus = .none
    @State private var confirmPasswordStatus: RDTextFieldStatus = .none
    @ObservedObject private var vm: AuthenticationVM
    
    private var isFormValid: Bool {
        return emailStatus == .success &&
               passwordStatus == .success &&
               confirmPasswordStatus == .success &&
               vm.password == vm.confirmPassword
    }
}
