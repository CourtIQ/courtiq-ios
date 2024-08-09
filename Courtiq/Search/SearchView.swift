//
//  SearchView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import SwiftUI
import RDDesignSystem
import InstantSearchSwiftUI

struct SearchView: View {
    
    // MARK: - Lifecycle
    
    init(vm: SearchVM,
         showSideMenu: Binding<Bool>)
    {
        self._vm = StateObject(wrappedValue: vm)
        self._showSideMenu = showSideMenu
    }
    
    // MARK: - Internal
    
    @Binding var showSideMenu: Bool
    
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
                        onSubmit: { vm.searchBoxController.submit() },
                        value: $vm.searchBoxController.query,
                        state: .constant(.normal),
                        isEditing: $vm.searchFieldIsEditing)
            .padding(.horizontal, 12)

        } content: {
            VStack {
                Text("No Results")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
    
    // MARK: - Private
    
    @StateObject private var vm: SearchVM
}
