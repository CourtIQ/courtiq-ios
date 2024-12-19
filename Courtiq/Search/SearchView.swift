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
                RDActionIcon(type: .ghost, size: .medium, image: Image.Token.Icons.menu) {
                    showSideMenu.toggle()
                }
            }, trailing: {
                RDActionIcon(type: .ghost, size: .medium, image: Image.Token.Icons.filter) {
                    vm.handle(action: .filterButtonTapped)
                }
            })
            
            RDTextField(
                textFieldType: .search,
                placeholder: "Search...",
                onSubmit: { print("Search Pressed") },
                value: $searchText,
                state: .constant(.normal)
            )
            .padding(.horizontal, 12)
            .padding(.bottom, 4)
            
        } content: {
//            VStack {
//                HitsList(vm.hitsController) { hit, _ in
//                    SearchListProfileItem(imageUrl: hit?.imageUrls?[.small]?.url,
//                                   name: hit?.displayName ?? "--", 
//                                   gender: hit?.gender ?? "--",
//                                   country: hit?.nationality ?? "--",
//                                   age: self.calculateAge(from: hit?.dob))
//                    {
//                        // TODO: Fix the age that is not being displayed
//                        vm.handle(action: .userSearchItemTapped(user: hit!))
//                    }
//                } noResults: {
//                    Text("No Results")
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                }
//            }
            EmptyView()
        }
    }
    
    // MARK: - Private
    
    @StateObject private var vm: SearchVM
    @State private var searchText: String = ""
    private func calculateAge(from dateOfBirth: Date?) -> String {
        guard let dateOfBirth = dateOfBirth else {
            return "--"
        }

        let calendar = Calendar.current
        let birthYear = calendar.component(.year, from: dateOfBirth)
        let currentYear = calendar.component(.year, from: Date())
        let age = currentYear - birthYear

        if age >= 0 && age < 150 {
            return String(age)
        } else {
            return "--"
        }
    }

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
