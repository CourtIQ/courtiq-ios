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
import RelationshipService

struct HomeBaseTabsView: View {
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var appRouter: AppRouter
    @EnvironmentObject var userService: UserService
    @EnvironmentObject var relationsService: RelationshipService

    @ObservedObject var vm: HomeBaseVM
    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch vm.selectedTab {
                case 0:
                    HomeView(showSideMenu: $vm.sideMenuShowing)
                case 1:
                    let vm = SearchVM(router: appRouter,
                                      userService: userService,
                                      relationsService: relationsService)
                    SearchView(vm: vm,
                               showSideMenu: $vm.sideMenuShowing)
                    .environmentObject(relationsService)
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
