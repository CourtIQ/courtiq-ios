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
                    RDButtonView(.extraLarge, .secondary, "Login") {
                        Task {
                            do {
                                try await authService.signIn(email: "pranavsuri@icloud.com", password: "Puru4303")
                            } catch {
                                print("Logout failed: \(error)")
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
