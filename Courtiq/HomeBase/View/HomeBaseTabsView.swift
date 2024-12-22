//
//  HomeBaseTabsView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import SwiftUI
import RDDesignSystem
import AuthenticationService
import EquipmentService
import UserService

struct HomeBaseTabsView: View {
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var appRouter: AppRouter

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
                               vm: TennisVM(router: appRouter))
                case 3:
                    ChatView(showSideMenu: $vm.sideMenuShowing)
                case 4:
                    Text("hello worls")

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
