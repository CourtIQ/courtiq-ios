//
//  HomeBaseRootView.swift
//  Tennis
//
//  Created by Pranav Suri on 23/12/22.
//

import AuthenticationService
import SwiftUI
import RDDesignSystem
import UserService

// MARK: - HomeBaseRootView

struct HomeRootFlowView: View {
    
    // MARK: - Lifecycle

    init(authService: any AuthServiceProtocol,
         router: AppRouter)
    {
        _vm = StateObject(wrappedValue: HomeBaseVM(authService: authService, router: router))
    }

    // MARK: - Internal

    var body: some View {
        
        ZStack {
            HomeBaseTabsView(vm: vm)
                .gesture(
                    DragGesture()
                        .onEnded({ (value) in
                            if value.translation.width > 100 {
                                withAnimation {
                                    vm.handle(action: .showSideMenu)
                                }
                            }
                        })
                )
            SideMenuView(showSideMenu: $vm.sideMenuShowing,
                         selectedIndex: $selectingIndex,
                         authService: authService,
                         userService: userService)

        }

    }
    
    // MARK: - Private

    @StateObject private var vm: HomeBaseVM
    @GestureState private var gestureOffset: CGSize = .zero
    @State private var selectingIndex: Int = 0
    @EnvironmentObject private var authService: AuthService
    @EnvironmentObject private var userService: UserService

}

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRootFlowView(authService: AuthService(provider: FirebaseAuthProvider()), router: AppRouter())
            .environmentObject(AuthService(provider: FirebaseAuthProvider()))
            .environmentObject(AppRouter())
    }
}
