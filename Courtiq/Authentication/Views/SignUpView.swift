//
//  SignUpView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-15.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI

// MARK: SignUpView

struct SignUpView: View {
    
    // MARK: Internal
    
    init(vm: AuthenticationVM) {
        self.vm = vm
    }

    // MARK: - Body
    
    var body: some View {
        AuthenticationPage {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Sign Up",
                    leadingItem: AnyView(
                        Button(action: {
                            flow.pop(animated: true)
                        }, label: {
                            Image(systemName: "chevron.left")
                                .padding(.trailing, 16)
                        })
                    ),
                    bgColor: .white
                )
            )
        } footer: {
            RDButtonView(.extraLarge, .primary, "Sign up",
                         disable: !isFormValid) {
                Task {
                    vm.handle(action: .signUp)
                }
            }
        } content: {
            VStack(spacing: 16) {
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
        }
    }
    
    // MARK: - Private
    
    @State private var emailStatus: RDTextFieldStatus = .none
    @State private var passwordStatus: RDTextFieldStatus = .none
    @State private var confirmPasswordStatus: RDTextFieldStatus = .none
    @EnvironmentObject private var flow: FlowProvider
    @ObservedObject private var vm: AuthenticationVM
    
    private var isFormValid: Bool {
        return emailStatus == .success &&
               passwordStatus == .success &&
               confirmPasswordStatus == .success &&
               vm.password == vm.confirmPassword
    }
}

// MARK: - Preview

#Preview {
    SignUpView(vm: AuthenticationVM(authService: AuthService(provider: FirebaseAuthService()), flow: FlowProvider(rootView: EmptyView())))
}
