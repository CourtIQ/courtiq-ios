//
//  ContentView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-12.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI
import UserService
import StorageService
// MARK: - ContentView

struct ContentView: View {
    // MARK: Internal
    
    var body: some View {
        Group {
            NavigationStack(path: $router.navigationPath) {
                if authService.isUserLoggedIn {
                    HomeBaseRootView(authService: authService, router: router)
                        .navigationDestination(for: ViewWrapper.self) { view in
                            view.view
                        }
                    
                } else {
                    AuthenticationWelcomeView(vm: AuthenticationVM(authService: authService, userService: userService, router: router, storageService: StorageService()))
                        .navigationDestination(for: ViewWrapper.self) { view in
                            view.view
                        }
                        .background(Color.TokenColor.Semantic.Background.primary)

                }
                
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
    
    // MARK: Private
    
    @EnvironmentObject private var userService: UserService
    @EnvironmentObject private var authService: AuthService
    @EnvironmentObject private var router: AppRouter
    
}

// MARK: - Preview

#Preview {
    ContentView()
        .environmentObject(AuthService(provider: FirebaseAuthService()))
        .environmentObject(AppRouter())
}
