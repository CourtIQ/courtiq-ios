//
//  RDActionRowItem.swift
//
//
//  Created by Pranav Suri on 2024-08-07.
//

import SwiftUI

// MARK: - RDActionRowItem

public struct RDActionRowItem: View {
    public let value: String
    public let title: String
    public let action: () -> Void

    public init(value: String, title: String, action: @escaping () -> Void) {
        self.value = value
        self.title = title
        self.action = action
    }

    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Button(action: action) {
                    Text(value)
                        .rdSmallBodyBold()
                        .foregroundColor(Color.TokenColor.Semantic.Text.default)
                }
                .buttonStyle(PlainButtonStyle())
                
                Text(title)
                    .rdSmallBody()
                    .foregroundColor(Color.TokenColor.Semantic.Text.primary)
            }
            Spacer()
        }
        .background(Color.clear)
        .cornerRadius(8)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Preview

struct RDActionRowItem_Previews: PreviewProvider {
    static var previews: some View {
        RDActionRowItem(
            value: "Title",
            title: "Subtitle",
            action: { print("Action tapped") }
        )
        .previewLayout(.sizeThatFits)
    }
}
