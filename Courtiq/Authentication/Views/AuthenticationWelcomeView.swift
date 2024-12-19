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
        MarqueeView {
            RDNavigationBar(.primary, title: "Welcome to CourtIQ")
        } content: {
            Image("welcomeImage")
                .resizable()
                .padding()
                .scaledToFit()
        } footer: {
            RDButtonView(.extraLarge, .primary, "Create an account.") {
                vm.handle(action: .goToSignUp)
            }
            RDButtonView(.extraLarge, .secondary, "Log in") {
                vm.handle(action: .goToSignIn)
            }

        }
        .background(Color.TokenColor.Semantic.Background.default)
        .onAppear() {
            if additionalInfoRequired && isUserLoggedIn {
                vm.handle(action: .goToAddInfo)
            }
        }
    }
    
    // MARK: - Private
    
    @AppStorage("additionalInfoRequired") private var additionalInfoRequired: Bool = false
    @AppStorage("isUserLoggedIn") private var isUserLoggedIn: Bool = false
    @StateObject private var vm: AuthenticationVM
}

// MARK: - Preview

//#Preview {
//    AuthenticationWelcomeView(
//        vm: AuthenticationVM(
//            authService: AuthService(
//                provider: FirebaseAuthProvider()),
//            userService: UserService(),
//            router: AppRouter()))
//}
