//
//  SearchView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import SwiftUI
import RDDesignSystem

struct SearchView: View {
    @Binding var showSideMenu: Bool
    @State var searchText: String? = ""

    private var navigationParams: RDTopNavigationParams {
        RDTopNavigationParams(
            type: .primaryWithSearch,
            title: "Search",
            leadingItem: (
                leadingItemType: .tertiary,
                leadingItemIcon: Image(systemName: "line.horizontal.3"),
                leadingItemAction: {
                    showSideMenu.toggle()
                }
            ),
            trailingItem: (
                trailingItemType: .tertiary,
                trailingItemIcon: Image("imprint"),
                trailingItemAction: { return }
            )
        )
    }

    var body: some View {
        BaseTabPageView {
            RDTopNavigationBar(
                params: navigationParams,
                searchText: $searchText
            )
        } content: {
            Text("SearchView")
        }
    }
}
