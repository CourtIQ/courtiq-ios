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

// MARK: SignInView

struct SignInView: View {
    
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
                    title: "Sign In",
                    leadingItem: AnyView(
                        RDIconButton(.tertiary, .small, Image(systemName: "chevron.left"), action: {
                            router.handle(action: .pop)
                        })
                    ),
                    bgColor: .white
                )
            )
            .background(Color.TokenColor.Semantic.Background.primary)
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
                HStack {
                    Text("Hello tester")
                        .font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 12))
                    Text("Hello tester")
                        .font(.system(size: 12))
                        .rdTitle1()
                }

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
    SignInView(vm: AuthenticationVM(authService: AuthService(provider: FirebaseAuthService()), userService: UserService(), router: AppRouter(), storageService: StorageService()))
}
