//
//  ContentView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-12.
//

import SwiftUI
import CourtIQAPI
import UserService
import StorageService
import AuthenticationService
import EquipmentService

struct ContentView: View {
    
    // MARK: - Initializer
    init() {

    }

    // MARK: - Body
    var body: some View {
        Group {
            NavigationStack(path: $router.navigationPath) {
                if isUserLoggedIn && !additionalInfoRequired {
                    HomeRootFlowView(
                        vm: HomeBaseVM(router: router))
                    .navigationDestination(for: ViewWrapper.self) { view in
                        view.view
                    }
                } else {
                    AuthenticationWelcomeView(
                        vm: AuthenticationVM(router: router,
                                             storageService: StorageService()))
                    .navigationDestination(for: ViewWrapper.self) { view in
                        view.view
                    }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                configureServices()
            }
        }
    }
    
    // MARK: Private
    
    @Dependency(\.graphQLClient) private var graphQLClient
    @Dependency(\.authService) private var authService
    @AppStorage("isUserLoggedIn") public var isUserLoggedIn: Bool = false
    @AppStorage("additionalInfoRequired") public var additionalInfoRequired: Bool = false
    @EnvironmentObject private var router: AppRouter
    @EnvironmentObject private var equipmentStore: EquipmentStore
    @EnvironmentObject private var userStore: UserStore
    
    private func configureServices() {
        DependencyValues[UserServiceKey.self] = UserService(graphQLClient: graphQLClient, store: userStore)
        DependencyValues[EquipmentServiceKey.self] = EquipmentService(graphQLClient: graphQLClient, store: equipmentStore)
    }
}

// MARK: - Preview
//
//#Preview {
//    ContentView()
//        .environmentObject(AuthService(provider: FirebaseAuthProvider()))
//        .environmentObject(AppRouter())
//}
