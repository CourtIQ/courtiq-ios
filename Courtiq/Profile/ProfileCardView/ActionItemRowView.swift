//
//  ActionItemRowView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-09.
//

import RDDesignSystem
import SwiftUI

// MARK: - ActionItemRowView

struct ActionItemRowView: View {

    // MARK: - Lifecycle
    
    init(items: [(title: String, count: Int, action: () -> Void)]) {
        self.items = items
    }

    // MARK: - Internal
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 2) {
                ForEach(0..<items.count, id: \.self) { index in
                    StatActionItemView(
                        title: items[index].title,
                        count: items[index].count,
                        action: items[index].action
                    )
                    .frame(width: geometry.size.width / CGFloat(items.count), alignment: .leading)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - Private
    
    private let items: [(title: String, count: Int, action: () -> Void)]
}

// MARK: - Preview

struct ActionItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ActionItemRowView(items: [
            (title: "Friends", count: 311, action: {}),
            (title: "Matches", count: 12, action: {}),
            (title: "Wins", count: 15, action: {}),
            (title: "Losses", count: 7, action: {})
        ])
        .frame(width: 200) // Set the total width to see the effect
    }
}
