//
//  RDCardView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-07.
//

import SwiftUI

// MARK: - CardType Enum

/// Enum representing different types of cards with associated styling properties.
public enum CardType {
    case primary
    case secondary
    case warning
    case success
    case error

    /// The background color associated with the card type.
    public var backgroundColor: Color {
        switch self {
        case .primary, .warning, .success, .error:
            Color.TokenColor.Semantic.Background.default
        case .secondary:
            Color.Token.greyWhite
        }
    }

    /// The border color associated with the card type.
    public var borderColor: Color {
        switch self {
        case .primary, .secondary:
            Color.TokenColor.Semantic.Border.default
        case .warning:
            Color.TokenColor.Semantic.Border.emphasis
        case .success:
            Color.TokenColor.Semantic.Border.success
        case .error:
            Color.TokenColor.Semantic.Border.error
        }
    }
}

// MARK: - RDCardView Struct

/// A reusable card view that wraps around any content and applies styling based on the card type.
public struct RDCardView<Content: View>: View {
    public var type: CardType
    public var content: Content

    /// Initializes the RDCardView with a specific card type and content.
    /// - Parameters:
    ///   - type: The type of the card which determines its styling.
    ///   - content: A view builder that provides the content to be displayed within the card.
    public init(type: CardType, @ViewBuilder content: () -> Content) {
        self.type = type
        self.content = content()
    }

    public var body: some View {
        content
            .padding(12)
            .background(type.backgroundColor)
            .cornerRadius(12)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(type.borderColor, lineWidth: 1)
            )
    }
}

// MARK: - Preview

struct RDCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RDCardView(type: .primary) {
                Text("Primary Card")
            }
            RDCardView(type: .secondary) {
                Text("Secondary Card")
            }
            RDCardView(type: .warning) {
                Text("Warning Card")
            }
            RDCardView(type: .success) {
                Text("Success Card")
            }
            RDCardView(type: .error) {
                Text("Error Card")
            }
        }
    }
}
