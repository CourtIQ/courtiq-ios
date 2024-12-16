//
//  RDBadgeView.swift
//
//
//  Created by Pranav Suri on 06/12/2024.
//

import SwiftUI

// MARK: - RDBadgeType
@available(iOS 13.0.0, *)
public enum RDBadgeType {
    case primary
    case secondary
    case success
    case error
    case warning
    
    var bgColor: Color {
        switch self {
        case .secondary:
            Color.white.opacity(0)
        case .primary:
            Color.TokenColor.Semantic.Background.primary
        case .error:
            Color.TokenColor.Semantic.Background.error
        case .success:
            Color.TokenColor.Semantic.Background.success
        case .warning:
            Color.TokenColor.Semantic.Background.warning
        }
    }
    
    var borderColor: Color {
        switch self {
        case .secondary:
            Color.TokenColor.Semantic.Border.primary
        default:
            Color.white.opacity(0)
        }
    }
    
    var textColor: Color {
        switch self {
        case .primary:
            Color.TokenColor.Semantic.Text.inverted
        case .secondary:
            Color.TokenColor.Semantic.Text.secondary
        case .error:
            Color.TokenColor.Semantic.Text.error
        case .success:
            Color.TokenColor.Semantic.Text.success
        case . warning:
            Color.TokenColor.Semantic.Text.warning
        }
    }
}

// MARK: - RDBadgeView
@available(iOS 13.0.0, *)
public struct RDBadgeView: View {
    let label: String
    let rdBadgeType: RDBadgeType
    
    public init(
        label: String,
        rdBadgeType: RDBadgeType
    ) {
        self.label = label
        self.rdBadgeType = rdBadgeType
    }
    
    public var body: some View {
        Text(label)
            .foregroundColor(rdBadgeType.textColor)
            .lineLimit(1)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .rdButtonSmall()
            .background(rdBadgeType.bgColor)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(rdBadgeType.borderColor, lineWidth: 1)
            )
    }
}

#if DEBUG
struct RDBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            Spacer()
            HStack{
                Spacer()
                RDBadgeView(label: "WIN", rdBadgeType: .success)
                RDBadgeView(label: "LOSS", rdBadgeType: .error)
                RDBadgeView(label: "LIVE", rdBadgeType: .primary)
                RDBadgeView(label: "PENDING", rdBadgeType: .secondary)
                RDBadgeView(label: "PENDING", rdBadgeType: .warning)
                Spacer()
            }

            Spacer()
        }
        .padding()
        .background(Color.TokenColor.Semantic.Background.default)
        .previewLayout(.sizeThatFits)
    }
}
#endif
