//
//  SignInView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-15.
//

import RDDesignSystem
import SwiftUI
import AuthenticationService

struct SignInView: View {
    @State private var searchText = ""
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject private var authService: AuthManager

    var body: some View {
        AuthenticationPage {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Sign In",
                    leadingItem: AnyView(
                        Image(systemName: "chevron.left")
                            .padding(.trailing, 16)
                    ),
                    bgColor: .white
                ),
                searchText: $searchText
            )
        } footer: {
            RDButtonView(.extraLarge, .primary, "Sign in",
                         disable: email.isEmpty || password.isEmpty) {
            }
        } content: {
            VStack(spacing: 16) {
                RDTextField(
                    params: RDTextFieldParams(type: .primary, placeholder: "Enter email"),
                    text: $email,
                    validationType: .email
                )
                RDTextField(
                    params: RDTextFieldParams(type: .password, placeholder: "Enter password"),
                    text: $password,
                    validationType: .password
                )
            }
        }
    }
}

#Preview {
    SignInView()
}

#warning("TODO: Add Forgot Password button")
#warning("TODO: Add Dont have an account? Create an account. Button")
