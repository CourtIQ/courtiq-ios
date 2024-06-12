//
//  RDBadgeView.swift
//  
//
//  Created by DynamicLayers on 05/11/2023.
//

import SwiftUI

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

@available(iOS 13.0.0, *)
public struct RDBadgeView: View {
    let value: String
    let ckBadgeType: RDBadgeType
    
    public init(
        value: String,
        ckBadgeType: RDBadgeType
    ) {
        self.value = value
        self.ckBadgeType = ckBadgeType
    }
    
    public var body: some View {
        Text(value)
            .foregroundColor(.white)
            .lineLimit(1)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .font(.system(size: 12, weight: .bold))
            .background(ckBadgeType.bgColor)
            .cornerRadius(20)
    }
}
