//
//  SignInView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-15.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI

// MARK: SignInView

struct SignInView: View {
    
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
                    title: "Sign In",
                    leadingItem: AnyView(
                        RDIconButton(.tertiary, .small, Image(systemName: "chevron.left"), action: {
                            router.handle(action: .pop)
                        })
                    ),
                    bgColor: .white
                )
            )
        } footer: {
            RDButtonView(.small, .ghost, "Create an account.") {
                vm.handle(action: .signUpFromSignIn)
            }

            RDButtonView(.extraLarge, .primary, "Sign in",
                         disable: vm.email.isEmpty || vm.password.isEmpty) {
                vm.handle(action: .signInBtn)
            }
            
                        
        } content: {
            VStack(spacing: 16) {
                Image("loginImage")
                    .scaledToFit()
                    .padding(.vertical, 20)
                RDTextField(
                    params: RDTextFieldParams(type: .primary, placeholder: "Enter email"),
                    text: $vm.email,
                    validationType: .email
                )
                RDTextField(
                    params: RDTextFieldParams(type: .password, placeholder: "Enter password"),
                    text: $vm.password,
                    validationType: .password
                )
                HStack {
                    Spacer()
                    RDButtonView(.small, .ghost, "Forgot password?") {
                        vm.handle(action: .goToFrgtPswd)
                    }
                }

            }
        }
    }
    
    // MARK: - Private
    
    @ObservedObject private var vm: AuthenticationVM
    @EnvironmentObject private var router: AppRouter
}

// MARK: - Preview

#Preview {
    SignInView(vm: AuthenticationVM(authService: AuthService(provider: FirebaseAuthService()), router: AppRouter()))
}
