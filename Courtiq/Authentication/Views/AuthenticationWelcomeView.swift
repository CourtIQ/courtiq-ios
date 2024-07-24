//
//  AuthenticationCoordinatorView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-23.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI
import UserService

// MARK: AuthenticationWelcomeView

struct AuthenticationWelcomeView: View {
    
    // MARK: Internal
    
    init(vm: AuthenticationVM) {
        self._vm = StateObject(wrappedValue: vm)
    }

    var body: some View {
        AuthenticationPage {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Welcome to CourtIQ"
                )
            )
        } footer: {
            RDButtonView(.extraLarge, .primary, "Create an account.") {
                vm.handle(action: .goToSignUp)
            }
            RDButtonView(.extraLarge, .secondary, "Log in") {
                vm.handle(action: .goToSignIn)
            }
        } content: {
            Image("welcomeImage")
                .resizable()
                .padding()
                .scaledToFit()
        }
        .background(Color.TokenColor.Semantic.Background.appBackground)

    }
    
    // MARK: - Private
    
    @StateObject private var vm: AuthenticationVM
}

// MARK: - Preview

//#Preview {
//    AuthenticationWelcomeView(
//        vm: AuthenticationVM(
//            authService: AuthService(
//                provider: FirebaseAuthService()),
//            userService: UserService(),
//            router: AppRouter()))
//}
