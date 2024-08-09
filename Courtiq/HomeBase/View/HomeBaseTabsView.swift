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
    @Binding var showSideMenu: Bool
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var appRouter: AppRouter
    @EnvironmentObject var userService: UserService
    @ObservedObject var vm: HomeBaseVM
    var body: some View {
        VStack{
            switch vm.selectedTab {
            case 0:
                HomeView(showSideMenu: $vm.showSideMenu)
            case 1:
                SearchView(vm: SearchVM(),
                           showSideMenu: $vm.showSideMenu)
            case 2:
                TennisView(showSideMenu: $vm.showSideMenu,
                           vm: TennisVM(router: appRouter,
                                        authService: authService))
            case 3:
                ProfileView(showSideMenu: $vm.showSideMenu,
                            userService: userService,
                            authService: authService,
                            router: appRouter)
            default:
                EmptyView()
            }
            Spacer()
            RDTabBar(items: vm.tabBarItems, selectedIndex: $vm.selectedTab)
        }
        .frame(width: getRect().width)
        .background(Color.TokenColor.Semantic.Background.default)
    }
}
