//
//  NewUserInformationView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-15.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI
import UserService

struct NewUserInformationView: View {
    var body: some View {
        AuthenticationPage {
            RDTopNavigationView(params: RDTopNavigationParams(type: .primary,
                                                              title: "Additional Information"))
        } footer: {
            RDButtonView(.large, .primary, "Next") {
                vm.handle(action: .updateAddInfoBtn)
                print("hello")
            }
        } content: {
            RDTextField(
                params: RDTextFieldParams(
                    type: .primary,
                    placeholder: "First name"),
                text: Binding(
                    get: { vm.user.firstName ?? "" },
                    set: { vm.user.firstName = $0 }
                )
            )
            RDTextField(
                params: RDTextFieldParams(
                    type: .primary,
                    placeholder: "Last name"),
                text: Binding(
                    get: { vm.user.lastName ?? "" },
                    set: { vm.user.lastName = $0 }
                )
            )
        }
    }
    
    @ObservedObject var vm: AuthenticationVM
}

#Preview {
    NewUserInformationView(vm: AuthenticationVM(authService: AuthService(provider: FirebaseAuthService()), userService: UserService(), router: AppRouter()))
}
