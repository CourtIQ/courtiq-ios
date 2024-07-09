//
//  HomeBaseVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import Foundation
import AuthenticationService
import SwiftUI
import RDDesignSystem

class HomeBaseVM: ObservableObject {
    @Published var selectedTab: Int = 0
    @Published var offset: CGFloat = 0
    @Published var lastStoredOffset: CGFloat = 0
    @Published var showSideMenu = false

    let tabBarItems = [
        RDTabBarItem(title: "Home", icon: Image("home")),
        RDTabBarItem(title: "Search", icon: Image("search")),
        RDTabBarItem(title: "Tennis", icon: Image("home")),
        RDTabBarItem(title: "Profile", icon: Image("user"))
    ]

    private let authService: any AuthServiceProtocol
    private let router: AppRouter

    init(authService: any AuthServiceProtocol, router: AppRouter) {
        self.authService = authService
        self.router = router
    }

    func handleMenuToggle(sideBarWidth: CGFloat) {
        if showSideMenu && offset == 0 {
            offset = sideBarWidth
            lastStoredOffset = offset
        } else if !showSideMenu && offset == sideBarWidth {
            offset = 0
            lastStoredOffset = 0
        }
    }

    func onChange(gestureOffset: CGFloat, sideBarWidth: CGFloat) {
        offset = gestureOffset + lastStoredOffset
        if offset > sideBarWidth {
            offset = sideBarWidth
        } else if offset < 0 {
            offset = 0
        }
    }

    func onEnd(value: DragGesture.Value) {
        let sideBarWidth = UIScreen.main.bounds.width * 0.75
        let translation = value.translation.width

        withAnimation {
            if translation > 0 {
                if translation > (sideBarWidth / 4) {
                    openMenu(sideBarWidth: sideBarWidth)
                } else {
                    closeMenu(sideBarWidth: sideBarWidth)
                }
            } else {
                if -translation > (sideBarWidth / 4) {
                    closeMenu(sideBarWidth: sideBarWidth)
                } else {
                    openMenu(sideBarWidth: sideBarWidth)
                }
            }
        }
        lastStoredOffset = offset
    }

    private func openMenu(sideBarWidth: CGFloat) {
        offset = sideBarWidth
        showSideMenu = true
    }

    func closeMenu(sideBarWidth: CGFloat) {
        offset = 0
        showSideMenu = false
    }
}
