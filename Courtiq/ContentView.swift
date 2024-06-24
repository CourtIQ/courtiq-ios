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
                HomeView()
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
            flow.replace([HomeView().environmentObject(flow)])
        } else {
            flow.replace([AuthenticationWelcomeView(vm: AuthenticationVM(authService: authService, flow: flow)).environmentObject(flow)])
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView()
        .environmentObject(AuthService(provider: FirebaseAuthService()))
}
