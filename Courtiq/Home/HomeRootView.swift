//
//  NewBaseView.swift
//  Tennis
//
//  Created by Pranav Suri on 23/12/22.
//

import AuthenticationService
import SwiftUI
import RDDesignSystem

struct HomeRootView: View {
    @State private var showMenu: Bool = false
    @State private var offset: CGFloat = 0
    @State private var lastStoredOffset: CGFloat = 0
    @GestureState private var gestureOffset: CGFloat = 0
    @EnvironmentObject private var authService: AuthService
    @EnvironmentObject private var router: AppRouter

    var body: some View {
        let sideBarWidth = getRect().width * 0.75

        HStack(spacing: 0) {
            SideMenu()
            TestHomeView(showSideMenu: $showMenu)
                .overlay(
                    showMenu ?
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                        withAnimation {
                            closeMenu(sideBarWidth: sideBarWidth)
                        }
                    }:
                    nil
                )
        }
        .frame(width: getRect().width + sideBarWidth)
        .offset(x: -sideBarWidth / 2)
        .offset(x: max(offset, 0))
        .gesture(
            DragGesture()
                .updating($gestureOffset) { value, out, _ in
                    out = value.translation.width
                }
                .onEnded(onEnd(value:))
        )
        .animation(.easeOut, value: offset)
        .onChange(of: showMenu) { _ in
            handleMenuToggle(sideBarWidth: sideBarWidth)
        }
        .onChange(of: gestureOffset) { _ in
            onChange(sideBarWidth: sideBarWidth)
        }
    }
    
    private func handleMenuToggle(sideBarWidth: CGFloat) {
        if showMenu && offset == 0 {
            offset = sideBarWidth
            lastStoredOffset = offset
        } else if !showMenu && offset == sideBarWidth {
            offset = 0
            lastStoredOffset = 0
        }
    }

    private func onChange(sideBarWidth: CGFloat) {
        offset = gestureOffset + lastStoredOffset
        if offset > sideBarWidth {
            offset = sideBarWidth
        } else if offset < 0 {
            offset = 0
        }
    }

    private func onEnd(value: DragGesture.Value) {
        let sideBarWidth = getRect().width * 0.75
        let translation = value.translation.width

        withAnimation {
            if translation > 0 {
                if translation > (sideBarWidth / 4) {
                    openMenu(sideBarWidth: sideBarWidth)
                } else {
                    closeMenu(sideBarWidth: sideBarWidth)
                }
            } else {
                if -translation > (sideBarWidth / 4) {
                    closeMenu(sideBarWidth: sideBarWidth)
                } else {
                    openMenu(sideBarWidth: sideBarWidth)
                }
            }
        }
        lastStoredOffset = offset
    }

    private func openMenu(sideBarWidth: CGFloat) {
        offset = sideBarWidth
        showMenu = true
    }

    private func closeMenu(sideBarWidth: CGFloat) {
        offset = 0
        showMenu = false
    }

    private func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRootView()
            .environmentObject(AuthService(provider: FirebaseAuthService()))
            .environmentObject(AppRouter())
    }
}
