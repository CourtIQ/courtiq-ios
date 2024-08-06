//
//  HomeView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-08.
//

import SwiftUI
import RDDesignSystem

struct HomeView: View {
    @Binding var showSideMenu: Bool

    private var navigationParams: RDTopNavigationParams {
        RDTopNavigationParams(
            type: .primary,
            title: "CourtIQ",
            leadingItem: (
                leadingItemType: .tertiary,
                leadingItemIcon: Image(systemName: "line.horizontal.3"),
                leadingItemAction: {
                    showSideMenu.toggle()
                }
            ),
            trailingItem: (
                trailingItemType: .tertiary,
                trailingItemIcon: Image(systemName: "person.crop.circle"),
                trailingItemAction: {
                    print("Profile Button pressed")
                }
            )
        )
    }

    var body: some View {
        BaseTabPageView {
            RDTopNavigationBar(
                params: navigationParams
            )
        } content: {
            Text("Hello, World!")
        }
    }
}
