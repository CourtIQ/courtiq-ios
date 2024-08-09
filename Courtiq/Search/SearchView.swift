//
//  SearchView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import SwiftUI
import RDDesignSystem
import UserService
import InstantSearchSwiftUI

struct SearchView: View {
    @Binding var showSideMenu: Bool
    @State private var searchText: String = ""
    @State private var isEditing = false
    @ObservedObject var searchBoxController: SearchBoxObservableController
    @ObservedObject var hitsController: HitsObservableController<User>
    @ObservedObject var statsController: StatsTextObservableController
    
    var body: some View {
        BaseTabPageView {
            RDNavigationBar(.primary, title: "Search", leading: {
                Image.Token.Icons.menu
                    .rdActionIcon {
                        showSideMenu.toggle()
                    }
            }, trailing: {
                Image.Token.Icons.filter
                    .rdActionIcon {
                        print("Settings")
                    }
            })
            RDTextField(textFieldType: .search,
                        placeholder: "Search for players or matches...",
                        onSubmit: { searchBoxController.submit() },
                        value: $searchBoxController.query,
                        state: .constant(.normal), 
                        isEditing: $isEditing)
            .padding(.horizontal, 12)

        } content: {
            VStack {

                
                if !hitsController.hits.isEmpty {
                    ScrollView(.vertical) {
                        LazyVStack(spacing: 8) {
                            ForEach(hitsController.hits.compactMap { $0 }) { user in
                                ProfileRowView(
                                    imageUrl: user.imageUrl ?? "",
                                    name: "\(user.firstName ?? "") \(user.lastName ?? "")",
                                    gender: "Male",
                                    country: "",
                                    age: "23",
                                    action: { print("go to hit") })
                                .padding(.horizontal, 2)
                            }
                        }
                        .padding(.top, 2)
                    }
                    .frame(maxWidth: .infinity)

                } else {
                    Text("No Results")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }
}
