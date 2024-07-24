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
import RDDesignSystem

// MARK: - AppDelegate

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        for family in UIFont.familyNames {
             print(family)
             for names in UIFont.fontNames(forFamilyName: family){
             print("== \(names)")
             }
        }
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
    @Environment(\.colorScheme) var colorScheme

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
                .background(Color.TokenColor.Semantic.Background.appBackground)
        }
    }
}
