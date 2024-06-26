//
//  NewUserInformationView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-15.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI

struct NewUserInformationView: View {
    var body: some View {
        AuthenticationPage {
            RDTopNavigationView(params: RDTopNavigationParams(type: .primary,
                                                              title: "Additional Information"))
        } footer: {
            RDButtonView(.large, .primary, "Next") {
                print("hello")
            }
        } content: {
            Text("Hello")
        }
    }
    
    @ObservedObject var vm: AuthenticationVM
}

#Preview {
    NewUserInformationView(vm: AuthenticationVM(authService: AuthService(provider: FirebaseAuthService()), router: AppRouter()))
}
