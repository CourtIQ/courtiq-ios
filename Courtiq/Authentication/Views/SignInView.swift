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
    
    // MARK: - Body
    
    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Sign in", leading: {
                RDActionIcon(type: .ghost,
                             size: .medium,
                             image: Image.Token.Icons.back) {
                    router.handle(action: .pop)

                }
            }, trailing: {})
        } content: {
            VStack(spacing: 16) {
                
                Image("loginImage")
                    .scaledToFit()
                    .padding(.vertical, 20)
                // TODO: Update Image
                
                RDTextField(textFieldType: .primary,
                            placeholder: "Email",
                            leadingIcon: Image.Token.Icons.envelope,
                            value: $vm.email,
                            state: $emailState)
                
                RDTextField(textFieldType: .password,
                            placeholder: "Password",
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
                         disable: disableSignInBtn) {
                vm.handle(action: .signInBtn)
            }
        }
        .navigationBarHidden(true)
    }
    
    private var disableSignInBtn: Bool {
        vm.email.isEmpty || vm.password.isEmpty
    }
    
    @ObservedObject private var vm: AuthenticationVM
    @EnvironmentObject private var router: AppRouter
    @State private var emailState = RDTextField.RDTextFieldState.normal
    @State private var passwordState = RDTextField.RDTextFieldState.normal
    @State private var repeatPasswordState = RDTextField.RDTextFieldState.normal
}
