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
    @State private var emailState = RDTextField.RDTextFieldState.normal

    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Reset password", leading: {}, trailing: {
                Image.Token.Icons.close
                    .rdActionIcon {
                        vm.router.handle(action: .dismiss)
                    }
            })
        } content: {
            Image("forgotPassword")
                .resizable()
                .padding(.horizontal, 60)
                .padding(.vertical, 10)
                .scaledToFit()
            
            RDTextField(
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
