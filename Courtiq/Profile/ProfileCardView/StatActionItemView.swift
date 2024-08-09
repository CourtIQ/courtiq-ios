//
//  StatActionItemView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-07.
//

import SwiftUI

// MARK: - StatActionItemView

struct StatActionItemView: View {

    // MARK: - Lifecycle

    init(title: String,
         count: Int,
         action: @escaping () -> Void = {}
    ) {
        self.action = action
        self.item = (title, count)
    }

    // MARK: - Internal

    var body: some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading, spacing: 2) {
                Text("\(item.value)")
                    .rdBody()
                    .foregroundStyle(Color.TokenColor.Semantic.Text.default)
                Text(item.stat)
                    .rdCaption()
                    .foregroundStyle(Color.TokenColor.Semantic.Text.primary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Private
    
    private let item: (stat: String, value: Int)
    private let action: () -> Void
}

// MARK: - Preview

struct ProfileCardActionItemView_Previews: PreviewProvider {
    static var previews: some View {
        StatActionItemView(title: "Friends", count: 22)
    }
}
