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
                        RDIconButton(.tertiary, .medium, "chevron.left", action: {
                            vm.flow.popToRoot()
                        })
                    ),
                    bgColor: .white
                )
            )
        } footer: {
            RDButtonView(.extraLarge, .primary, "Sign in",
                         disable: vm.email.isEmpty || vm.password.isEmpty) {
                vm.handle(action: .signIn)
            }
        } content: {
            VStack(spacing: 16) {
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
            }
        }
    }
    
    // MARK: - Private
    
    @ObservedObject private var vm: AuthenticationVM
}

// MARK: - Preview

#Preview {
    SignInView(vm: AuthenticationVM(authService: AuthService(provider: FirebaseAuthService()), flow: FlowProvider(rootView: EmptyView())))
}
