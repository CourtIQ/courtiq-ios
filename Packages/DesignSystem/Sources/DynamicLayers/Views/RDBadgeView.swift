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
    case defalt
    case success
    case error
    case new
    
    var bgColor: Color {
        switch self {
        case .defalt:
            return .badgeDefaultBg
        case .success:
            return .green500
        case .error:
            return .red500
        case .new:
            return .purple500
        }
    }
}

// MARK: - RDBadgeView
@available(iOS 13.0.0, *)
public struct RDBadgeView: View {
    let value: String
    let rdBadgeType: RDBadgeType
    
    public init(
        value: String,
        rdBadgeType: RDBadgeType
    ) {
        self.value = value
        self.rdBadgeType = rdBadgeType
    }
    
    public var body: some View {
        Text(value)
            .foregroundColor(.white)
            .lineLimit(1)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .font(.system(size: 12, weight: .bold))
            .background(rdBadgeType.bgColor)
            .cornerRadius(20)
    }
}
