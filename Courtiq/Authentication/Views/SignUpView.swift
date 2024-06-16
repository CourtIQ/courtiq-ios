//
//  SignUpView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-15.
//

import RDDesignSystem
import SwiftUI
import AuthenticationService

struct SignUpView: View {
    @State private var searchText = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var emailStatus: RDTextFieldStatus = .none
    @State private var passwordStatus: RDTextFieldStatus = .none
    @State private var confirmPasswordStatus: RDTextFieldStatus = .none
    @EnvironmentObject private var authService: AuthManager

    var isFormValid: Bool {
        return emailStatus == .success &&
               passwordStatus == .success &&
               confirmPasswordStatus == .success &&
               password == confirmPassword
    }

    var body: some View {
        AuthenticationPage {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Sign Up",
                    leadingItem: AnyView(
                        Image(systemName: "chevron.left")
                            .padding(.trailing, 16)
                    ),
                    bgColor: .white
                ),
                searchText: $searchText
            )
        } footer: {
            RDButtonView(.extraLarge, .primary, "Sign up",
                         disable: !isFormValid) {
            }
        } content: {
            VStack(spacing: 16) {
                RDTextField(
                    params: RDTextFieldParams(type: .primary, placeholder: "Enter email"),
                    text: $email,
                    status: $emailStatus,
                    validationType: .email
                )
                RDTextField(
                    params: RDTextFieldParams(type: .password, placeholder: "Enter password"),
                    text: $password,
                    status: $passwordStatus,
                    validationType: .password
                )
                RDTextField(
                    params: RDTextFieldParams(type: .password, placeholder: "Confirm password"),
                    text: $confirmPassword,
                    status: $confirmPasswordStatus,
                    validationType: .password
                )
            }
        }
    }
}

#Preview {
    SignUpView()
}

#warning ("TODO: Add sign-up implementation")
#warning ("TODO: Add already have an account button")
#warning ("TODO: Add sign in with google and other stuff button")
#warning ("TODO: Add VM or coordinator to handle stuff.")
