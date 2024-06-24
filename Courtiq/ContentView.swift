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
    
    @Flow var flow

    var body: some View {
        Group {
            if authService.isUserLoggedIn {
                HomeView(authService: authService)
                    .environmentObject(flow)
            } else {
                AuthenticationWelcomeView(vm: AuthenticationVM(authService: authService, flow: flow))
                    .environmentObject(flow)
                    .environmentObject(authService)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    // MARK: Private
    
    @EnvironmentObject private var authService: AuthService

    private func configureInitialFlow() {
        if authService.isUserLoggedIn {
            flow.replace([HomeView(authService: authService).environmentObject(flow)])
        } else {
            flow.replace([AuthenticationWelcomeView(vm: AuthenticationVM(authService: authService, flow: flow)).environmentObject(flow)])
        }
    }
}

// MARK: - HomeView

struct HomeView: View {
    // MARK: Internal
    var authService: AuthService
    @Flow var flow
    var body: some View {
        VStack {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Home",
                    bgColor: .white
                )
            )
            Spacer()
            RDButtonView(.extraLarge, .tertiary, "Logout", action: {
                Task {
                    try await authService.signOut()
                    flow.reload()
                }
            })
                .navigationBarHidden(true)
            Spacer()
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView()
        .environmentObject(AuthService(provider: FirebaseAuthService()))
}
