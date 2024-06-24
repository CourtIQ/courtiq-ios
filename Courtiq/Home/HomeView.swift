//
//  HomeView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import SwiftUI
import RDDesignSystem

struct HomeView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
                    // Side Menu
                    SideMenu(isOpen: $viewModel.isSideMenuOpen) {
                        viewModel.handleAction(.toggleSideMenu)
                    }

                    // Main Content
                    VStack(spacing: 0) {
                        // Custom Top Bar


                        // Content Area
                        viewModel.selectedTab.destination.view

                        // Bottom Navigation Bar
                        RDBottomNavigationBar(items: MainViewModel.Tab.allCases.map { $0.item }, selectedIndex: Binding(
                            get: { viewModel.selectedTab.rawValue },
                            set: { viewModel.selectedTab = MainViewModel.Tab(rawValue: $0) ?? .home }
                        ))
                        .background(Color.white)
                        .shadow(radius: 10)
                    }
                    .offset(x: viewModel.isSideMenuOpen ? 250 : 0)
                    .animation(.easeInOut)
                    .gesture(DragGesture().onChanged { gesture in
                        if gesture.translation.width > 50 {
                            viewModel.handleAction(.toggleSideMenu)
                        } else if gesture.translation.width < -50 {
                            viewModel.handleAction(.toggleSideMenu)
                        }
                    })
                }
    }
}
struct SideMenu: View {
    @Binding var isOpen: Bool
    let toggleAction: () -> Void

    var body: some View {
        VStack {
            Button(action: toggleAction) {
                Text("Close Menu")
            }
            .padding()

            // Add your menu items here
            Button(action: {
                // Navigate to settings
                toggleAction()
            }) {
                Text("Settings")
            }
        }
        .frame(maxWidth: 250)
        .background(Color.gray.opacity(0.8))
        .offset(x: isOpen ? 0 : -250)
    }
}

#Preview {
    HomeView()
}
