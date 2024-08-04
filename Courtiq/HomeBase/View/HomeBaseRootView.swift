//
//  HomeBaseRootView.swift
//  Tennis
//
//  Created by Pranav Suri on 23/12/22.
//

import AuthenticationService
import SwiftUI
import RDDesignSystem

struct HomeBaseRootView: View {
    @StateObject private var viewModel: HomeBaseVM
    @GestureState private var gestureOffset: CGFloat = 0
    @State private var selectingIndex: Int = 0
    private var menuItems = [
        MenuItem(title: "Home", icon: "home"),
        MenuItem(title: "My Friends", icon: "friends"),
        MenuItem(title: "Settings", icon: "setting"),
        MenuItem(title: "Logout", icon: "logout")
    ]


    init(authService: any AuthServiceProtocol, router: AppRouter) {
        _viewModel = StateObject(wrappedValue: HomeBaseVM(authService: authService, router: router))
    }

    var body: some View {
        let sideBarWidth = UIScreen.main.bounds.width * 0.75
        
        ZStack {
            HomeBaseTabsView(showSideMenu: $viewModel.showSideMenu, vm: viewModel)
            SideMenuView(openSideMenu: $viewModel.showSideMenu, selectedIndex: $selectingIndex, menuItems: menuItems, menuConfig: SideMenuConfig(menuWidth: sideBarWidth, menuDirection: .left, swipeToClose: true, tapToClose: true, showAppVersion: true, versionText: "Test"))
        }
    }
}

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBaseRootView(authService: AuthService(provider: FirebaseAuthProvider()), router: AppRouter())
            .environmentObject(AuthService(provider: FirebaseAuthProvider()))
            .environmentObject(AppRouter())
    }
}
