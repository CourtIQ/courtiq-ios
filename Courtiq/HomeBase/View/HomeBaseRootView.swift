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
    @GestureState private var gestureOffset: CGSize = .zero
    @State private var selectingIndex: Int = 0
    @EnvironmentObject private var authService: AuthService
    
    init(authService: any AuthServiceProtocol,
         router: AppRouter)
    {
        _viewModel = StateObject(wrappedValue: HomeBaseVM(authService: authService, router: router))
    }

    var body: some View {
        let sideBarWidth = UIScreen.main.bounds.width * 0.75
        
        ZStack {
            HomeBaseTabsView(showSideMenu: $viewModel.showSideMenu, 
                             vm: viewModel)
                .gesture(
                    DragGesture()
                        .onEnded({ (value) in
                            if value.translation.width > 100 {
                                withAnimation {
                                    self.viewModel.showSideMenu = true
                                }
                            }
                        })
                )
            SideMenuView(showSideMenu: $viewModel.showSideMenu,
                         selectedIndex: $selectingIndex,
                         authService: authService)

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
