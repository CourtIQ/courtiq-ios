//
//  CourtiqApp.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-12.
//

import AuthenticationService
import FirebaseCore
import EquipmentService
import UserService
import CourtIQAPI
import RDDesignSystem
import SwiftUI
import SwiftData

// MARK: - AppDelegate

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        
        UILabel.appearance().textColor = UIColor(Color.TokenColor.Semantic.Text.default)
        
        return true
    }
}

// MARK: - CourtiqApp

@main
struct CourtiqApp: App {
    // MARK: - Properties
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var router = AppRouter()
    @StateObject private var userStore = UserStore()
    @StateObject private var equipmentStore: EquipmentStore = EquipmentStore()


    // MARK: - Initialization
    
    init() {
    }
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
                .environmentObject(userStore)
                .environmentObject(equipmentStore)
                .modifier(SheetModifier(router: router))
                .background(Color.TokenColor.Semantic.Background.default)
                .withLoading(router.isLoading)
        }
    }
}

// MARK: - View Modifiers

struct SheetModifier: ViewModifier {
    @ObservedObject var router: AppRouter
    
    func body(content: Content) -> some View {
        content
            .sheet(item: $router.currentSheet) { sheet in
                sheet.view
            }
            .sheet(item: $router.currentHalfSheet) { sheet in
                sheet.view
                    .presentationDetents(Set(router.halfSheetDetents))
            }
            .fullScreenCover(item: $router.currentScreenCover) { screen in
                ScreenCoverView(viewWrapper: screen)
                    .environmentObject(router)
            }
    }
}

extension View {
    func withLoading(_ isLoading: Bool) -> some View {
        ZStack {
            self
            
            if isLoading {
                LoadingView()
                    .transition(.opacity)
            }
        }
    }
}
