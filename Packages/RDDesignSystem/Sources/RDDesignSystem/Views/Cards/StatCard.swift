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
    
    enum StatCardType {
        case primary, secondary
    }
    
    // MARK: - Lifecycle
    
    public init(title: String,
                count: Int,
                action: @escaping () -> Void = {},
                icon: Image
    ) {
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
                    .foregroundColor(Color.TokenColor.Semantic.Text.default)
                HStack(spacing: 8) {
                    Text("\(count)")
                        .rdTitle3()
                        .foregroundStyle(Color.TokenColor.Semantic.Text.default)
                    icon
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(Color.TokenColor.Semantic.Icon.default)
                }
            }
            Spacer()
        }
        .padding(20)
        .background(content: {
            Color.TokenColor.Semantic.Background.tertiary
        })
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerSize: .init(width: 12, height: 12))
                .strokeBorder(Color.TokenColor.Semantic.Border.default)
        }
    }
    
    // MARK: - Private
    
    private var title: String
    private var count: Int
    private var action: () -> Void
    private var icon: Image
    
}

#Preview {
    HStack {
        StatCard(title: "Wins", count: 1, icon: Image.Token.Icons.arrowUp)

        StatCard(title: "Losses", count: 1, icon: Image.Token.Icons.arrowUp)

    }
}
//
//extension StatCard.StatCardType {
//    var backgroundColor: Color {
//        switch self {
//        case .primary:
//            <#code#>
//        case .secondary:
//            <#code#>
//        }
//    }
//}
