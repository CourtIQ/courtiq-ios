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
            RDNavigationBar(.primary, title: "Search")
        } content: {
            Text("SearchView")
        }
    }
}
