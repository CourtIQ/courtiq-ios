//
//  CourtiqApp.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-12.
//

import AuthenticationService
import FirebaseCore
import SwiftUI
import SwiftData
import UserService

// MARK: - AppDelegate

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

// MARK: - CourtiqApp

@main
struct CourtiqApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authService = AuthService(provider: FirebaseAuthService())
    @StateObject var router = AppRouter()
    @StateObject var userService = UserService()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authService)
                .environmentObject(router)
                .environmentObject(userService)
                .sheet(item: $router.currentSheet) { sheet in
                    sheet.view
                }
                .sheet(item: $router.currentHalfSheet) { sheet in
                    sheet.view
                        .presentationDetents(Set(arrayLiteral: .medium))
                }
                .fullScreenCover(item: $router.currentScreenCover) { screen in
                    screen.view
                }
        }
    }
}
