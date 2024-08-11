//
//  ProfileClubsListView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-10.
//

import RDDesignSystem
import SwiftUI

struct ProfileClubsListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            title
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(0..<25) { index in
                        ClubsListItemView()
                    }
                }
            }
        }
    }
    
    // MARK: - Private
    
    @ViewBuilder
    private func ClubsListItemView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            AvatarImage(size: .medium, url: "https://picsum.photos/200")
            Text("Club Name")
                .rdCaption()
                .foregroundStyle(Color.TokenColor.Semantic.Text.default)
        }
    }
    
    @ViewBuilder
    private var title: some View {
        Text("Clubs")
            .rdBodyBold()
            .foregroundStyle(Color.TokenColor.Semantic.Text.default)
    }
}

#Preview {
    ProfileClubsListView()
}
