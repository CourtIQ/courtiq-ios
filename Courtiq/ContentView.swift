//
//  ContentView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-12.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    // MARK: Internal
    
    var body: some View {
        Group {
            NavigationStack(path: $router.navigationPath) {
                if authService.isUserLoggedIn {
                    HomeView(vm: HomeVM(authService: authService))
                        .navigationDestination(for: ViewWrapper.self) { view in
                            view.view
                        }
                } else {
                    AuthenticationWelcomeView(vm: AuthenticationVM(authService: authService, router: router))
                        .navigationDestination(for: ViewWrapper.self) { view in
                            view.view
                        }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
    
    // MARK: Private
    
    @EnvironmentObject private var authService: AuthService
    @EnvironmentObject private var router: AppRouter
    
}

// MARK: - Preview

#Preview {
    ContentView()
        .environmentObject(AuthService(provider: FirebaseAuthService()))
        .environmentObject(AppRouter())
}
