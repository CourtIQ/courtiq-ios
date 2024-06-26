//
//  HomeVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import Foundation
import AuthenticationService
import SwiftUI
import RDDesignSystem

class HomeVM: ObservableObject {
    @Published var selectedTab: Tab = .home
    @Published var isSideMenuOpen: Bool = false
    @Published var selectedSideMenuDestination: Destination?
    
    var authService: any AuthServiceProtocol
    var router: AppRouter
    init(authService: any AuthServiceProtocol, router: AppRouter) {
        self.authService = authService
        self.router = router
    }

    func handleAction(_ action: Action) {
        switch action {
        case .selectTab(let tab):
            selectedTab = tab
        case .toggleSideMenu:
            isSideMenuOpen.toggle()
        case .selectSideMenuTab(let destination):
            selectedSideMenuDestination = destination
            isSideMenuOpen = false
        }
    }


    enum Action {
        case selectTab(Tab)
        case toggleSideMenu
        case selectSideMenuTab(Destination)
    }

    enum Tab: Int, CaseIterable {
        case home
        case search
        case notifications
        case profile

        var item: RDBottomItem {
            switch self {
            case .home:
                return RDBottomItem(title: "Home", icon: "house")
            case .search:
                return RDBottomItem(title: "Search", icon: "magnifyingglass")
            case .notifications:
                return RDBottomItem(title: "Notifications", icon: "bell")
            case .profile:
                return RDBottomItem(title: "Profile", icon: "person")
            }
        }

        var view: some View {
            switch self {
            case .home:
                return Text("home")
            case .search:
                return Text("search")
            case .notifications:
                return Text("notifications")
            case .profile:
                return Text("profile")
            }
        }
    }

    enum Destination {
        case profile
        case search
        case home
        case notifications
        case dashboard
        case settings
        @ViewBuilder
        var view: some View {
            switch self {
            case .profile:
                VStack {
                    Spacer()
                    Text("profile")
                }
            case .search:
                VStack {
                    Spacer()
                    Text("search")
                }
            case .home:
                VStack {
                    Spacer()
                    Text("home")
                }
            case .notifications:
                VStack {
                    Spacer()
                    Text("notifications")
                }
            case .dashboard:
                VStack {
                    Spacer()
                    Text("dashboard")
                }
            case .settings:
                VStack {
                    Spacer()
                    Text("settings")
                }
            }
        }
    }
}
