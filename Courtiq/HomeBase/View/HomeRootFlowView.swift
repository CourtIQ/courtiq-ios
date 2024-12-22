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

    init(vm: HomeBaseVM) {
        _vm = StateObject(wrappedValue: vm)
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
            SideMenuView(vm: SideMenuVM(),
                         showSideMenu: $vm.sideMenuShowing,
                         selectedIndex: $vm.selectedTab)
        }
        .onAppear {
            vm.onAppear()
        }

    }
    
    // MARK: - Private
    @StateObject private var vm: HomeBaseVM
    @GestureState private var gestureOffset: CGSize = .zero
    @State private var selectingIndex: Int = 0
}

//struct HomeRootView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeRootFlowView(authService: AuthService(provider: FirebaseAuthProvider()), router: AppRouter())
//            .environmentObject(AuthService(provider: FirebaseAuthProvider()))
//            .environmentObject(AppRouter())
//    }
//}
