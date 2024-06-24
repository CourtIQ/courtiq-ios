//
//  AuthenticationCoordinatorView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-23.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI

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
                    title: "Welcome to CourtIQ",
                    bgColor: .white
                )
            )
        } footer: {
            RDButtonView(.extraLarge, .primary, "Create an account.") {
                vm.handle(action: .showSignUp)
            }
            RDButtonView(.extraLarge, .secondary, "Log in") {
                vm.handle(action: .showSignIn)
            }
        } content: {
            Text("Hello")
        }
    }
    
    // MARK: - Private
    
    @StateObject private var vm: AuthenticationVM
}

// MARK: - Preview

#Preview {
    AuthenticationWelcomeView(vm: AuthenticationVM(authService: AuthService(provider: FirebaseAuthService()), flow: FlowProvider(rootView: EmptyView())))
}
