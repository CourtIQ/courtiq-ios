//
//  HomeView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import SwiftUI
import RDDesignSystem
import AuthenticationService
import StringEntryService
import UserService

struct HomeBaseTabsView: View {
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var appRouter: AppRouter
    @EnvironmentObject var userService: UserService
    @ObservedObject var vm: HomeBaseVM
    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch vm.selectedTab {
                case 0:
                    HomeView(showSideMenu: $vm.sideMenuShowing)
                case 1:
                    SearchView(vm: SearchVM(router: appRouter),
                               showSideMenu: $vm.sideMenuShowing)
                case 2:
                    TennisView(showSideMenu: $vm.sideMenuShowing,
                               vm: TennisVM(router: appRouter,
                                            authService: authService))
                case 3:
                    ProfileView(showSideMenu: $vm.sideMenuShowing,
                                userService: userService,
                                authService: authService,
                                router: appRouter)
                default:
                    EmptyView()
                }
            }
            .animation(.easeInOut, value: vm.selectedTab)

            RDTabBar(items: vm.tabBarItems, selectedIndex: $vm.selectedTab)
        }
        .frame(width: getRect().width)
        .background(Color.TokenColor.Semantic.Background.default)
    }
}
