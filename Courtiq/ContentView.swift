//
//  ContentView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-12.
//

import SwiftUI
import SwiftData
import RDDesignSystem
import AuthenticationService

struct ContentView: View {
    @StateObject var authService = AuthManager(authService: FirebaseAuthService())
    var body: some View {
        VStack {
            HStack {
                if authService.isUserLoggedIn {
                    RDButtonView(.extraLarge, .secondary, "Logout") {
                        Task {
                            do {
                                try await authService.signOut()
                            } catch {
                                print("Logout failed: \(error.localizedDescription)")
                            }
                        }
                    }
                } else {
                    SignInView()
                        .environmentObject(authService)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
