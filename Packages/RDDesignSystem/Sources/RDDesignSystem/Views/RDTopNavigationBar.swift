//
//  RDNavigationBar.swift
//
//
//  Created by Pranav Suri on 13/06/2024.
//

import SwiftUI

// MARK: - RDNavigationBarType

public enum RDNavigationBarType {
    case primary
    case secondary

    var bgColor: Color {
        switch self {
        case .primary:
            return Color.TokenColor.Semantic.Background.default
        case .secondary:
            return Color.Token.greyWhite
        }
    }
    
    var titleColor: Color {
        switch self {
        case .primary, .secondary:
            return Color.TokenColor.Semantic.Text.default
        }
    }
}

// MARK: - RDNavigationBar

@available(iOS 15.0, *)
public struct RDNavigationBar<LeadingContent: View, TrailingContent: View>: View {
    var type: RDNavigationBarType
    var title: String
    var leadingContent: LeadingContent?
    var trailingContent: TrailingContent?

    // MARK: - Initializer

    public init(
        _ type: RDNavigationBarType,
        title: String,
        @ViewBuilder leading: () -> LeadingContent,
        @ViewBuilder trailing: () -> TrailingContent
    ) {
        self.type = type
        self.title = title
        self.leadingContent = leading()
        self.trailingContent = trailing()
    }

    public init(
        _ type: RDNavigationBarType,
        title: String
    ) where LeadingContent == EmptyView, TrailingContent == EmptyView {
        self.type = type
        self.title = title
        self.leadingContent = EmptyView()
        self.trailingContent = EmptyView()
    }
    
    // MARK: - Body

    public var body: some View {
        HStack {
            HStack {
                if let leadingContent = leadingContent {
                    leadingContent
                }
            }
            .frame(width: 56, height: 56)
            
            HStack {
                Spacer()
                Text(title)
                    .rdSubheadline()
                    .lineLimit(1)
                    .foregroundColor(type.titleColor)
                    .padding(.horizontal, 16)
                Spacer()
            }
            .frame(maxWidth: .infinity)

            HStack {
                if let trailingContent = trailingContent {
                    trailingContent
                }
            }
            .frame(width: 56, height: 56)
        }
        .frame(maxWidth: .infinity, maxHeight: 56)
        .background(type.bgColor)
    }
}

// MARK: - Preview

struct RDNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RDNavigationBar(.primary, title: "Title") {
                Button(action: {}) {
                    Image(systemName: "bell")
                        .foregroundColor(.blue)
                }
            } trailing: {
                Button(action: {}) {
                    Image(systemName: "gear")
                        .foregroundColor(.blue)
                }
            }
            
            RDNavigationBar(.secondary, title: "Title Only")
            
            RDNavigationBar(.primary, title: "Only Leading") {} trailing: {
                Button(action: {}) {
                    Image(systemName: "bell")
                        .foregroundColor(.blue)
                }
            }
            
            RDNavigationBar(.primary, title: "Only Trailing") {} trailing: {
                Button(action: {}) {
                    Image(systemName: "gear")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
