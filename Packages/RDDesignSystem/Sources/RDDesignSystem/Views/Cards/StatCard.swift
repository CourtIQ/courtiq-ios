//
//  SwiftUIView.swift
//  
//
//  Created by Pranav Suri on 2024-08-10.
//

import SwiftUI

// MARK: - StatCard

public struct StatCard: View {
    
    // MARK: - Enums
    
    public enum StatCardType {
        case primary, secondary, tertiary
    }
    
    // MARK: - Lifecycle
    
    public init(_ type: StatCardType = .secondary,
                title: String,
                count: Int,
                action: @escaping () -> Void = {},
                icon: Image
    ) {
        self.type = type
        self.title = title
        self.count = count
        self.action = action
        self.icon = icon
    }
    // MARK: - Internal
    
    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .rdSubheadline()
                HStack(spacing: 8) {
                    Text("\(count)")
                        .rdTitle3()
                    icon
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
            .foregroundColor(type.labelColor)
            Spacer()
        }
        .padding(20)
        .background(type.backgroundColor)
        .background(content: {
            if type == .tertiary {
                tertiaryBg
            }
        })
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerSize: .init(width: 12, height: 12))
                .strokeBorder(type.borderColor, lineWidth: 1)
        }
    }
    
    // MARK: - Private
    
    private var type: StatCardType
    private var title: String
    private var count: Int
    private var action: () -> Void
    private var icon: Image
    private let tertiaryBg = LinearGradient(
        gradient: Gradient(colors: [Color.Token.magenta300,
                                    Color.Token.purple500]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

#Preview {
    HStack {
        StatCard(title: "Wins", count: 1, icon: Image.Token.Icons.arrowUp)

        StatCard(title: "Losses", count: 1, icon: Image.Token.Icons.arrowUp)

    }
}

extension StatCard.StatCardType {
    var backgroundColor: Color {
        switch self {
        case .primary:
            Color.TokenColor.Semantic.Background.tertiary
        case .secondary:
            Color.TokenColor.Component.StatCard.secondaryBackground
        case .tertiary:
            Color.clear
        }
    }
    
    var borderColor: Color {
        switch self {
        case .primary:
            return Color.TokenColor.Semantic.Border.default
        case .secondary, .tertiary:
            return Color.clear
        }
    }
    
    var labelColor: Color {
        switch self {
        case .primary, .secondary, .tertiary:
            return Color.TokenColor.Semantic.Text.default
        }
    }
}
