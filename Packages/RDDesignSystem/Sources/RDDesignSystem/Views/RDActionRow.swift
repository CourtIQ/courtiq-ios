//
//  RDActionRow.swift
//
//
//  Created by Pranav Suri on 2024-08-07.
//

import SwiftUI

// MARK: - RDActionRow

public struct RDActionRow: View {
    public let actionItems: [(value: String, title: String, action: () -> Void)]

    public init(actionItems: [(value: String, title: String, action: () -> Void)]) {
        self.actionItems = actionItems
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 4) {
            ForEach(actionItems.indices, id: \.self) { index in
                RDActionRowItem(
                    value: actionItems[index].value,
                    title: actionItems[index].title,
                    action: actionItems[index].action
                )
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Preview

struct RDActionRow_Previews: PreviewProvider {
    static var previews: some View {
        RDActionRow(actionItems: [
            (value: "Friends", title: "22", action: {}),
            (value: "Friends", title: "22", action: {}),
            (value: "Friends", title: "22", action: {}),
            (value: "Friends", title: "22", action: {})
        ])
        .previewLayout(.sizeThatFits)
    }
}
