//
//  ProfileCardActionItemView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-07.
//

import SwiftUI

// MARK: - ProfileCardActionItemView

struct ProfileCardActionItemView: View {
    let title: String
    let count: Int

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("\(count)")
                .rdBody()
                .foregroundStyle(Color.TokenColor.Semantic.Text.default)
            Text(title)
                .rdSmallBodyBold()
                .foregroundStyle(Color.TokenColor.Semantic.Text.primary)
        }
    }
}

// MARK: - Preview

struct ProfileCardActionItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardActionItemView(title: "Friends", count: 22)
    }
}
