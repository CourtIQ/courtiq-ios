//
//  SearchView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import SwiftUI
import RDDesignSystem
import InstantSearchSwiftUI
import UserService

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
                        vm.handle(action: .filterButtonTapped)
                    }
            })
            
            RDTextField(
                textFieldType: .search,
                placeholder: "Search for players or matches...",
                onSubmit: {
                    if !vm.searchBoxController.query.isEmpty {
                        vm.searchBoxController.submit()
                    }
                },
                value: $vm.searchBoxController.query,
                state: .constant(.normal),
                isEditing: $vm.searchFieldIsEditing)
            .padding(.horizontal, 12)
            .onChange(of: vm.searchBoxController.query) { query in
                if query.isEmpty {
                    vm.hitsController.hits = []
                }
            }
            
        } content: {
            VStack {
                HitsList(vm.hitsController) { hit, _ in
                    ProfileRowView(imageUrl: hit?.imageUrls?[.small]?.url ?? "", name: hit?.displayName ?? "--", gender: "M", country: "IND", age: "22") {
                        vm.handle(action: .userSearchItemTapped(user: hit!))
                    }
                } noResults: {
                    Text("No Results")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }

                
            }
        }
    }
    
    // MARK: - Private
    
    @StateObject private var vm: SearchVM
}
// MARK: - FullWidthSeparatorModifier

public struct FullWidthSeparatorModifier: ViewModifier {
    public let leadingOffset: CGFloat
    public let trailingOffset: CGFloat

    public func body(content: Content) -> some View {
        content
            .listRowSeparatorLeading(offset: leadingOffset)
    }
}

// MARK: View Extension

extension View {
    /// Applies a full-width separator style with custom leading and trailing offsets.
    /// - Parameters:
    ///   - leadingOffset: The leading offset for the separator.
    ///   - trailingOffset: The trailing offset for the separator.
    /// - Returns: A view with the applied full-width separator style.
    public func fullWidthSeparator(leadingOffset: CGFloat = -16, trailingOffset: CGFloat = 0) -> some View {
        modifier(FullWidthSeparatorModifier(leadingOffset: leadingOffset, trailingOffset: trailingOffset))
    }
}

public struct ListRowSeparatorLeadingModifier: ViewModifier {

    // MARK: Public

    public let offset: CGFloat
    
    public func body(content: Content) -> some View {
        #if os(watchOS)
        content
        #else
        content
            .alignmentGuide(.listRowSeparatorLeading) { _ in
                offset
            }
        #endif
    }
}

// MARK: View

extension View {

    public func listRowSeparatorLeading(offset: CGFloat) -> some View {
        modifier(ListRowSeparatorLeadingModifier(offset: offset))
    }
}
