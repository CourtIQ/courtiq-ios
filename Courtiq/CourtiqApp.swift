//
//  CourtiqApp.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-12.
//

import AuthenticationService
import FirebaseCore
import InstantSearchTelemetry
import EquipmentService
import RDDesignSystem
import RelationshipService
import StorageService
import SwiftUI
import SwiftData
import UserService
import CourtIQAPI

// MARK: - AppDelegate

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        UILabel.appearance().textColor = UIColor(Color.TokenColor.Semantic.Text.default)

        InstantSearchTelemetry.shared.isEnabled = false

        return true
    }
}

// MARK: - CourtiqApp

@main
struct CourtiqApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @StateObject var router = AppRouter()
    @StateObject var relationsService = RelationshipService()
    @StateObject var storageService = StorageService()
    
    @StateObject var equipmentService: EquipmentService
    @StateObject var authService: AuthService
    @StateObject var userService: UserService

    let config = APIConfiguration(graphQLURLString: "https://api-gateway.court-iq.com/")

    init() {
        // Initialize authService
        let tempAuthService = AuthService(provider: FirebaseAuthProvider())
        _authService = StateObject(wrappedValue: tempAuthService)

        let apolloClient = ApolloClientProvider.createClient(
            config: config,
            authService: tempAuthService,
            cacheConfiguration: DefaultCacheConfiguration()
        )
        let graphQLClient = ApolloGraphQLClient(apollo: apolloClient)

        // Initialize userService now that graphQLClient and authService are available
        _userService = StateObject(wrappedValue: UserService(graphQLClient: graphQLClient))
        _equipmentService = StateObject(wrappedValue: EquipmentService(racketRepo: TennisRacketRepository(client: graphQLClient),
                                                                  stringRepo: TennisStringRepository(client: graphQLClient)))
    }
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                    .environmentObject(authService)
                    .environmentObject(router)
                    .environmentObject(userService)
                    .environmentObject(relationsService)
                    .environmentObject(storageService)
                    .environmentObject(equipmentService)
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
                    .background(Color.TokenColor.Semantic.Background.default)
//                    .transition(.opacity)
                
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
