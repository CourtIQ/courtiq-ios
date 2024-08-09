//  SideMenuView.swift
//  SideMenuView
//
//  Created by Parth Dumaswala on 31/10/23.
//

import AuthenticationService
import SwiftUI
import RDDesignSystem

// MARK: - SideMenuView

struct SideMenuView: View {
    
    // MARK: - Lifecycle
    
    public init(
        openSideMenu: Binding<Bool>,
        selectedIndex: Binding<Int>,
        menuItems: [MenuItem]
    ) {
        self._openSideMenu = openSideMenu
        self._selectedIndex = selectedIndex
        self.menuItems = menuItems
    }
    
    // MARK: - Internal
    
    @Binding var openSideMenu: Bool
    @Binding var selectedIndex: Int
    @State var menuItems: [MenuItem]
    
    public var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.black.opacity(0.2))
            .opacity(self.openSideMenu ? 1.0 : 0.0)
            .animation(.default.delay(0.25), value: openSideMenu)
            
            HStack {
                MarqueeView {
                    HStack {
                        Text("Side Menu")
                            .rdHeadline()
                    }
                    Text("Side Menu")
                        .rdHeadline()
                        .foregroundColor(Color.TokenColor.Semantic.Text.default)
                        .padding()
                } content: {
                    Text("Content")
                } footer: {
                    RDButtonView(.large, .primary, "Logout") {
                        Task {
                            try await authService.signOut()
                        }
                    }
                }
                .frame(width: sideMenuWidth)
                .offset(x: self.openSideMenu ? 0 : -sideMenuWidth)

                Spacer()
            }
        }
        .gesture(DragGesture(minimumDistance: 20, coordinateSpace: .global)
            .onEnded { value in
                withAnimation(.easeOut) {
                    let horizontalAmount = value.translation.width
                    let verticalAmount = value.translation.height
                    
                    if abs(horizontalAmount) > abs(verticalAmount) {
                        if horizontalAmount < 0 {
                            self.openSideMenu.toggle()
                        }
                    }
                }
            })
        .gesture(
            TapGesture()
                .onEnded { _ in
                    withAnimation {
                        self.openSideMenu.toggle()
                    }
                }
        )
    }
    
    // MARK: - Private
    
    @EnvironmentObject private var authService: AuthService
    
    private let sideMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.75
    private var viewWidth: CGFloat {
        UIScreen.main.bounds.width
    }
}

// MARK: - MenuItem

struct MenuItem: Hashable {
    
    // MARK: - Properties
    
    let title: String
    let iconName: String
    
    var icon: Image {
        Image(iconName)
    }
    
    // MARK: - Initializer
    
    public init(title: String, iconName: String) {
        self.title = title
        self.iconName = iconName
    }
}
