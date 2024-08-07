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

    private var navigationParams: RDTopNavigationParams {
        RDTopNavigationParams(
            type: .primary,
            title: "Sign In",
            leadingItem: (
                leadingItemType: .tertiary,
                leadingItemIcon: Image(systemName: "chevron.left"),
                leadingItemAction: {
                    router.handle(action: .pop)
                }
            )
        )
    }
    
    // MARK: - Body
    
    var body: some View {
        MarqueeView {
            RDTopNavigationBar(params: navigationParams)
        } content: {
            VStack(spacing: 16) {
                
                Image("loginImage")
                    .scaledToFit()
                    .padding(.vertical, 20)
                
                RDTextField(textFieldType: .primary,
                            placeholder: "Enter email",
                            icon: (leadingIcon: Image.Token.Icons.envelope, trailingIcon: nil),
                            value: $vm.email,
                            state: $emailState)
                
                RDTextField(textFieldType: .password,
                            placeholder: "Enter password",
                            icon: (leadingIcon: Image.Token.Icons.locked, trailingIcon: nil),
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
                         disable: vm.email.isEmpty || vm.password.isEmpty) {
                vm.handle(action: .signInBtn)
            }
        }
        .navigationBarHidden(true)
    }
}
