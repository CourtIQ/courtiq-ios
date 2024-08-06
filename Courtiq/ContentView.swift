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
    @AppStorage("isUserLoggedIn") public var isUserLoggedIn: Bool = false
    @AppStorage("additionalInfoNeeded") public var additionalInfoNeeded: Bool = false
    @AppStorage("currentUserUID") public var currentUserUID: String?
    
    var body: some View {
        Group {
            NavigationStack(path: $router.navigationPath) {
                if authService.isUserLoggedIn && !authService.additionalInfoNeeded {
                    HomeBaseRootView(authService: authService,
                                     router: router)
                    .navigationDestination(for: ViewWrapper.self) { view in
                        view.view
                    }
                    .onAppear {
                        print("User is logged in: \(authService.isUserLoggedIn)")
                        print("Additional info needed: \(authService.additionalInfoNeeded)")
                        print("Current user UID: \(authService.currentUserUID)")
                    }
                    
                } else if authService.isUserLoggedIn && authService.additionalInfoNeeded {
                    AdditionalInfoView(vm: AuthenticationVM(authService: authService,
                                                            userService: userService,
                                                            router: router,
                                                            storageService: StorageService()))
                    .navigationDestination(for: ViewWrapper.self) { view in
                        view.view
                    }
                    .onAppear {
                        print("User is logged in: \(authService.isUserLoggedIn)")
                        print("Additional info needed: \(authService.additionalInfoNeeded)")
                        print("Current user UID: \(authService.currentUserUID)")
                    }
                }
                else {
                    AuthenticationWelcomeView(vm: AuthenticationVM(authService: authService,
                                                                   userService: userService,
                                                                   router: router,
                                                                   storageService: StorageService()))
                    .navigationDestination(for: ViewWrapper.self) { view in
                        view.view
                    }
                    .background(Color.TokenColor.Semantic.Background.default)
                    .onAppear {
                        print("User is logged in: \(authService.isUserLoggedIn)")
                        print("Additional info needed: \(authService.additionalInfoNeeded)")
                        print("Current user UID: \(authService.currentUserUID)")
                    }
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
        .environmentObject(AuthService(provider: FirebaseAuthProvider()))
        .environmentObject(AppRouter())
}
