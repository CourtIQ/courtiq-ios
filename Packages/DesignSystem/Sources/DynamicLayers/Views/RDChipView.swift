//
//  RDChipView.swift
//  
//
//  Created by DynamicLayers on 06/11/2023.
//

import SwiftUI

public enum RDChipType {
    case small
    case medium
    case large
    
    var spaceArounded: (horizontal: CGFloat, vertical: CGFloat, between: CGFloat, badgeTextSize: CGFloat, badgeTextHorizontalSpacing: CGFloat) {
        switch self {
        case .small:
            return (8, 4, 4, 8, 6)
        case .medium:
            return (12, 8, 4, 12, 8)
        case .large:
            return (16, 8, 8, 12, 8)
        }
    }
    
    var textSize: CGFloat {
        switch self {
        case .small:
            return 12
        case .medium:
            return 14
        case .large:
            return 16
        }
    }
}

@available(iOS 15.0.0, *)
public struct RDChipView: View {
    
    var title: String
    @Binding var isActive: Bool
    var ckChipType: RDChipType
    var leadingIcon: String
    var chipValue: Int
    
    public init(
        title: String,
        isActive: Binding<Bool>,
        ckChipType: RDChipType = .large,
        leadingIcon: String,
        chipValue: Int = 0
    ) {
        self.title = title
        self._isActive = isActive
        self.ckChipType = ckChipType
        self.leadingIcon = leadingIcon
        self.chipValue = chipValue
    }
    
    public var body: some View {
        HStack(spacing: ckChipType.spaceArounded.between) {
            Image(leadingIcon)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.platinum700)
                .aspectRatio(contentMode: .fit)
                .frame(width: ckChipType.textSize)
            
            Text(title)
                .foregroundColor(.platinum950)
                .font(.system(size: ckChipType.textSize, weight: .regular))
            
            Text("\(chipValue)")
                .foregroundColor(.platinum950)
                .font(.system(size: ckChipType.spaceArounded.badgeTextSize, weight: .regular))
                .padding(.horizontal, ckChipType.spaceArounded.badgeTextHorizontalSpacing)
                .background(Color.chipBorderColor)
                .cornerRadius(20)
        }
        .padding(.vertical, ckChipType.spaceArounded.vertical)
        .padding(.horizontal, ckChipType.spaceArounded.horizontal)
        .background(Color.chipBgColor.opacity(isActive ? 1 : 0))
        .cornerRadius(25)
        .overlay {
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.chipBorderColor)
        }
        .onTapGesture {
            isActive.toggle()
        }
    }
}
