//
//  SignInView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-15.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI
import UserService
import StorageService

// MARK: - SignInView

struct SignInView: View {
    
    // MARK: - Properties
    init(vm: AuthenticationVM) {
        self.vm = vm
    }

    @ObservedObject private var vm: AuthenticationVM
    @EnvironmentObject private var router: AppRouter
    @State private var emailState = RDTextField.RDTextFieldState.normal
    @State private var passwordState = RDTextField.RDTextFieldState.normal
    @State private var repeatPasswordState = RDTextField.RDTextFieldState.normal
    
    // MARK: - Body
    
    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Sign in", leading: {
                Image.Token.Icons.back
                    .rdActionIcon {
                        router.handle(action: .pop)
                    }
            }, trailing: {})
        } content: {
            VStack(spacing: 16) {
                
                Image("loginImage")
                    .scaledToFit()
                    .padding(.vertical, 20)
                
                RDTextField(textFieldType: .primary,
                            placeholder: "Enter email",
                            leadingIcon: Image.Token.Icons.envelope,
                            value: Binding(get: { vm.user.email ?? "" }, set: { vm.user.email = $0 }),
                            state: $emailState)
                
                RDTextField(textFieldType: .password,
                            placeholder: "Enter password",
                            leadingIcon: Image.Token.Icons.locked,
                            value: $vm.password,
                            state: $passwordState)
                
                HStack {
                    RDButtonView(.small, .ghost, "Forgot password?") {
                        vm.handle(action: .goToFrgtPswd)
                    }
                }
            }
        } footer: {
            RDButtonView(.small, .ghost, "Create an account.") {
                vm.handle(action: .signUpFromSignIn)
            }
            
            RDButtonView(.extraLarge, .primary, "Sign in",
                         disable: vm.user.email == nil || vm.password.isEmpty) {
                vm.handle(action: .signInBtn)
            }
        }
        .navigationBarHidden(true)
    }
}
