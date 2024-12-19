//
//  TennisMatchesListView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-16.
//

import SwiftUI
import RDDesignSystem

public struct TennisMatchesListCell: View {
    public var body: some View {
        ScrollView(.vertical) {
            VStack {
                RDScoreCardView()
                RDScoreCardView()
                RDScoreCardView()
                RDScoreCardView()
                RDScoreCardView()
                RDScoreCardView()
                RDScoreCardView()
                RDScoreCardView()
            }
            .padding(.horizontal, 12)
        }
    }
}
