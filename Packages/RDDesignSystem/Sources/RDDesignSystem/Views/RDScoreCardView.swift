//
//  RDScoreCardView.swift
//  RDDesignSystem
//
//  Created by Pranav Suri on 2024-12-14.
//

import SwiftUI
import Foundation

@available(iOS 13.0, *)
public struct RDScoreCardView: View {
    public init() {}
    public var body: some View {
        Group {
            VStack(spacing: 0) {
                HStack {
                    Text("ITF Junior 2024")
                        .rdBodyBold()
                        .foregroundStyle(Color.TokenColor.Semantic.Text.default)
                        
                    Spacer()
                    RDBadgeView(label: "WIN", rdBadgeType: .success)
                    RDActionIcon(type: .ghost, size: .medium, image: Image.Token.Icons.chevronRight) {
                        print("Action")

                    }
                }

                HStack {
                    Group {
                        VStack(spacing: 8) {
                            HStack {
                                AvatarImage(size: .extraSmall, url: "https://picsum.photos/200/200")
                                Text("Pranav Suri")
                                    .rdBody()
                                    .foregroundStyle(Color.TokenColor.Semantic.Text.default)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                Spacer()
                            }
                            HStack {
                                AvatarImage(size: .extraSmall, url: "https://picsum.photos/200/200")
                                Text("Aldrin Ong")
                                    .rdBody()
                                    .foregroundStyle(Color.TokenColor.Semantic.Text.default)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                Spacer()
                            }
                            .padding(0)
                            
                        }
                        .frame(minWidth: 150)
                        .frame(height: 60)
                    }
                    Group {
                        HStack(spacing: 4) {
                            ScoreCell(scoreA: "6", scoreB: "4", isActive: false)
                            ScoreCell(scoreA: "4", scoreB: "6", isActive: false)
                            ScoreCell(scoreA: "6", scoreB: "4", isActive: false)
                            ScoreCell(scoreA: "4", scoreB: "6", isActive: false)
                            ScoreCell(scoreA: "5", scoreB: "5", isActive: false)
                            ScoreCell(scoreA: "40", scoreB: "AD", isActive: true)
                        }
                    }

                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                
                HStack {
                    Text("📍New Delhi, India")
                        .rdExtraSmallBody()
                        .foregroundStyle(Color.TokenColor.Semantic.Text.secondary)
                    Spacer()
                    Text("Dec 14 2024")
                        .rdExtraSmallBody()
                        .foregroundStyle(Color.TokenColor.Semantic.Text.secondary)
                }

                
            }
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.TokenColor.Semantic.Border.default, lineWidth: 1)
            )
        }
    }
}

struct ScoreCell: View {
    let scoreA: String
    let scoreB: String
    let isActive: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text(scoreA)
            Spacer()
            Text(scoreB)
            Spacer()
        }
        .rdSmallBody()
        .foregroundStyle(isActive ? Color.TokenColor.Semantic.Text.inverted : Color.TokenColor.Semantic.Text.default)
        .frame(height: 60)
        .frame(maxWidth: 28)
        .background(isActive ?
                    Color.TokenColor.Semantic.Background.primary
                    : Color.TokenColor.Semantic.Background.secondary)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}


#Preview {
    RDScoreCardView()
}
