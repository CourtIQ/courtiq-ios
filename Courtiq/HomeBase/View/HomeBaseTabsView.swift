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

struct HomeBaseTabsView: View {
    @Binding var showSideMenu: Bool
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var appRouter: AppRouter
    @ObservedObject var vm: HomeBaseVM
    var body: some View {
        Group {
            VStack{
                switch vm.selectedTab {
                case 0:
                    HomeView(showSideMenu: $vm.showSideMenu)
                case 1:
                    SearchView(showSideMenu: $vm.showSideMenu)
                case 2:
                    TennisView(showSideMenu: $vm.showSideMenu, 
                               vm: TennisVM(router: appRouter, 
                                            stringEntryService: StringEntryService()))
                case 3:
                    ProfileView(showSideMenu: $vm.showSideMenu)
                default:
                    EmptyView()
                }
                Spacer()
                RDTabBar(items: vm.tabBarItems, selectedIndex: $vm.selectedTab)
            }
            .frame(width: getRect().width)
            
        }
    }
}

// MARK: - Preview

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}


