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

class MainViewModel: ObservableObject {
    @Published var selectedTab: Tab = .home
    @Published var isSideMenuOpen: Bool = false

    func handleAction(_ action: Action) {
        switch action {
        case .selectTab(let tab):
            selectedTab = tab
        case .toggleSideMenu:
            isSideMenuOpen.toggle()
        }
    }

    enum Action {
        case selectTab(Tab)
        case toggleSideMenu
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

        var destination: Destination {
            switch self {
            case .home:
                return .home
            case .search:
                return .search
            case .notifications:
                return .notifications
            case .profile:
                return .profile
            }
        }
    }

    enum Destination {
        case profile
        case search
        case home
        case notifications

        @ViewBuilder
        var view: some View {
            switch self {
            case .profile:
                VStack {
                    Spacer()
                    Text("Profile")
                }
            case .search:
                VStack {
                    Spacer()
                    Text("Profile")
                }
            case .home:
                VStack {
                    Spacer()
                    Text("Profile")
                }
            case .notifications:
                VStack {
                    Spacer()
                    Text("Profile")
                }
            }
        }
    }
}
