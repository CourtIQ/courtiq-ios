//
//  CourtiqApp.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-12.
//

import AuthenticationService
import FirebaseCore
import InstantSearchTelemetry
import RDDesignSystem
import RelationshipService
import StorageService
import SwiftUI
import SwiftData
import UserService


// MARK: - AppDelegate

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        InstantSearchTelemetry.shared.isEnabled = false

        return true
    }
}

// MARK: - CourtiqApp

@main
struct CourtiqApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authService = AuthService(provider: FirebaseAuthProvider())
    @StateObject var router = AppRouter()
    @StateObject var userService = UserService()
    @StateObject var relationshipService = RelationshipService()
    @StateObject var storageService = StorageService()

    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                    .environmentObject(authService)
                    .environmentObject(router)
                    .environmentObject(userService)
                    .environmentObject(relationshipService)
                    .environmentObject(storageService)
                    .sheet(item: $router.currentSheet) { sheet in
                        sheet.view
                    }
                    .sheet(item: $router.currentHalfSheet) { sheet in
                        sheet.view
                            .presentationDetents(Set(arrayLiteral: .medium))
                    }
                    .fullScreenCover(item: $router.currentScreenCover) { screen in
                        ScreenCoverView(viewWrapper: screen)
                            .environmentObject(router)
                    }
                    .background(Color.TokenColor.Semantic.Background.default)
                    .transition(.opacity)
                
                if router.isLoading {
                    withAnimation {
                        LoadingView()
                            .transition(.opacity)
                    }
                }
            }
        }
    }
}


