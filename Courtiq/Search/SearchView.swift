//
//  SearchView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import SwiftUI
import RDDesignSystem
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
            if searchText == "" {
                RDEmptyPlaceholderView(title: "Ready to serve?",
                                       subtitle: "Search for tennis buddies or courts \nand start playing!",
                                       image: Image.Token.Graphics.emptySearchListIcon)
            } else {
                List {
                    ForEach(0...10, id: \.self) { value in
                        HStack {
                            AvatarImage(size: .small, url: "https://picsum.photos/200/")
                            VStack(alignment: .leading) {
                                Text("Pranav Suri")
                                    .rdBodyBold()
                                    .foregroundStyle(Color.TokenColor.Semantic.Text.default)
                                Text("@pranavsuri4393")
                                    .rdSmallBody()
                                    .foregroundStyle(Color.TokenColor.Semantic.Text.primary)
                            }
                            Spacer()
                            RDActionIcon(type: .ghost, size: .large, image: Image.Token.Icons.chevronRight) {
                                print("User selected")
                            }
                        }
                        .listRowBackground(Color.TokenColor.Semantic.Background.default)
                        .listRowSpacing(0)

                    }
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)            // iOS 16+
                .background(Color.TokenColor.Semantic.Background.default)
            }
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
