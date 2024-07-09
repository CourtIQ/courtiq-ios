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

    init(authService: any AuthServiceProtocol, router: AppRouter) {
        _viewModel = StateObject(wrappedValue: HomeBaseVM(authService: authService, router: router))
    }

    var body: some View {
        let sideBarWidth = UIScreen.main.bounds.width * 0.75

        HStack(spacing: 0) {
            SideMenuView()
            HomeBaseTabsView(showSideMenu: $viewModel.showSideMenu, vm: viewModel)
                .overlay(
                    viewModel.showSideMenu ?
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                        withAnimation {
                            viewModel.closeMenu(sideBarWidth: sideBarWidth)
                        }
                    }:
                    nil
                )
        }
        .frame(width: UIScreen.main.bounds.width + sideBarWidth)
        .offset(x: -sideBarWidth / 2)
        .offset(x: max(viewModel.offset, 0))
        .gesture(
            DragGesture()
                .updating($gestureOffset) { value, out, _ in
                    out = value.translation.width
                }
                .onEnded { value in
                    viewModel.onEnd(value: value)
                }
        )
        .animation(.easeOut, value: viewModel.offset)
        .onChange(of: viewModel.showSideMenu) { _ in
            viewModel.handleMenuToggle(sideBarWidth: sideBarWidth)
        }
        .onChange(of: gestureOffset) { newValue in
            viewModel.onChange(gestureOffset: newValue, sideBarWidth: sideBarWidth)
        }
    }
}

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBaseRootView(authService: AuthService(provider: FirebaseAuthService()), router: AppRouter())
            .environmentObject(AuthService(provider: FirebaseAuthService()))
            .environmentObject(AppRouter())
    }
}
