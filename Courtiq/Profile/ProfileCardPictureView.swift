//
//  ProfileCardPictureView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-07.
//

import SwiftUI

// MARK: - ProfileCardPictureView

struct ProfileCardPictureView: View {
    let imageUrl: URL?

    var body: some View {
        Group {
            if let imageUrl = imageUrl {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 60, height: 60)
                            .background(Color.clear)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.TokenColor.Semantic.Border.primary, lineWidth: 2)
                            )
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.TokenColor.Semantic.Border.primary, lineWidth: 2)
                            )
                    case .failure:
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.TokenColor.Semantic.Border.primary, lineWidth: 2)
                            )
                    @unknown default:
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.TokenColor.Semantic.Border.primary, lineWidth: 2)
                            )
                    }
                }
            } else {
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.TokenColor.Semantic.Border.primary, lineWidth: 2)
                    )
            }
        }
    }
}

// MARK: - Preview

struct ProfileCardPictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardPictureView(imageUrl: URL(string: "https://example.com/profile.jpg"))
    }
}
