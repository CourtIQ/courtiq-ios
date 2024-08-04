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
    var body: some View {
        
        BaseTabPageView {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primaryWithSearch,
                    title: "Search",
                    leadingItem: AnyView(
                        RDIconButton(
                            .tertiary, .small, Image(systemName: "line.horizontal.3"),
                            action: {
                                showSideMenu.toggle()
                            }
                        )
                    ),
                    trailingItem: AnyView(
                        RDIconButton(
                            .tertiary, .small, Image("imprint"),
                            action: {
                                print("filter button pressed")
                            }
                        )
                    )
                ),
                searchText: $searchText)
        } content: {
            Text("SearchView")

        }
    }
}
