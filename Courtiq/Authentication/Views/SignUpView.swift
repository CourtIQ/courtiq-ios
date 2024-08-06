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
