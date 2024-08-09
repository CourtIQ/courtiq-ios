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
        showSideMenu: Binding<Bool>,
        selectedIndex: Binding<Int>,
        authService: any AuthServiceProtocol
    ) {
        self._showSideMenu = showSideMenu
        self._selectedIndex = selectedIndex
        self._vm = StateObject(wrappedValue: SideMenuVM(authService: authService))
    }
    
    // MARK: - Internal
    
    @Binding var selectedIndex: Int
    @Binding var showSideMenu: Bool
    
    public var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.black.opacity(0.2))
            .opacity(showSideMenu ? 1.0 : 0.0)
            .animation(.default.delay(0.25), value: showSideMenu)
            
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
                        vm.handle(action: .logout)
                    }
                }
                .frame(width: sideMenuWidth)
                .offset(x: showSideMenu ? 0 : -sideMenuWidth)

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
                            showSideMenu.toggle()
                        }
                    }
                }
            })
        .gesture(
            TapGesture()
                .onEnded { _ in
                    withAnimation {
                        showSideMenu.toggle()
                    }
                }
        )
    }
    
    // MARK: - Private
    
    @StateObject private var vm: SideMenuVM

    private let sideMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.75
}

// MARK: - MenuItem

struct MenuItem: Hashable {
    
    // MARK: - Properties
    
    let title: String
    let icon: Image
    
    // MARK: - Initializer
    
    public init(title: String, icon: Image) {
        self.title = title
        self.icon = icon
    }
    
    // MARK: - Hashable Conformance
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    public static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.title == rhs.title
    }
}
