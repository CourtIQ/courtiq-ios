//
//  ForgotPasswordView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-15.
//

import RDDesignSystem
import SwiftUI
import AuthenticationService
import UserService

struct ForgotPasswordView: View {
    var body: some View {
        MarqueeView {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Reset password",
                    trailingItem: AnyView(
                        RDIconButton(
                        .tertiary,
                        .small, 
                        Image(systemName: "xmark"),
                        action: {
                            vm.router.handle(action: .dismiss)
                        }
                    ))
                )
            )
        } content: {
            Image("forgotPassword")
                .resizable()
                .padding(.horizontal, 60)
                .padding(.vertical, 10)
                .scaledToFit()
            RDTextField(params: RDTextFieldParams(placeholder: "Reset password email..."), text: $email, validationType: .email)
        } footer: {
            RDButtonView(.large, .primary, "Reset password") {
                vm.handle(action: .frgtPswdBtn)
            }
        }
    }
    @State private var email = ""
    @ObservedObject var vm: AuthenticationVM
}

//#Preview {
//    ForgotPasswordView(vm: AuthenticationVM(authService: AuthService(provider: FirebaseAuthProvider()), userService: UserService(), router: AppRouter(), storageService: <#any StorageServiceProtocol#>))
//}
