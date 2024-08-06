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
    @ObservedObject var vm: AuthenticationVM
    @State private var email = ""
    @State private var emailState = RDTextFieldUpdated.FieldState.normal

    private var navigationParams: RDTopNavigationParams {
        RDTopNavigationParams(
            type: .primary,
            title: "Reset password",
            trailingItem: (
                trailingItemType: .tertiary,
                trailingItemIcon: Image(systemName: "xmark"),
                trailingItemAction: {
                    vm.router.handle(action: .dismiss)
                }
            )
        )
    }

    var body: some View {
        MarqueeView {
            RDTopNavigationBar(params: navigationParams)
        } content: {
            Image("forgotPassword")
                .resizable()
                .padding(.horizontal, 60)
                .padding(.vertical, 10)
                .scaledToFit()
            
            RDTextFieldUpdated(
                textFieldType: .primary,
                placeholder: "Enter email",
                icon: (leadingIcon: Image(systemName: "envelope"), trailingIcon: nil),
                value: $email,
                state: $emailState
            )
        } footer: {
            RDButtonView(.large, .primary, "Reset password") {
                vm.handle(action: .frgtPswdBtn)
            }
        }
    }
}

//#Preview {
//    ForgotPasswordView(vm: AuthenticationVM(authService: AuthService(provider: FirebaseAuthProvider()), userService: UserService(), router: AppRouter(), storageService: <#any StorageServiceProtocol#>))
//}
