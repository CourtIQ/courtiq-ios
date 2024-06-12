//
//  RDChipView.swift
//
//
//  Created by Pranav Suri on 06/12/2024.
//

import SwiftUI

// MARK: - RDChipType
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

// MARK: - RDChipView
@available(iOS 15.0.0, *)
public struct RDChipView: View {
    
    var title: String
    @Binding var isActive: Bool
    var rdChipType: RDChipType
    var leadingIcon: String
    var chipValue: Int
    
    public init(
        title: String,
        isActive: Binding<Bool>,
        rdChipType: RDChipType = .large,
        leadingIcon: String,
        chipValue: Int = 0
    ) {
        self.title = title
        self._isActive = isActive
        self.rdChipType = rdChipType
        self.leadingIcon = leadingIcon
        self.chipValue = chipValue
    }
    
    public var body: some View {
        HStack(spacing: rdChipType.spaceArounded.between) {
            Image(leadingIcon)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.platinum700)
                .aspectRatio(contentMode: .fit)
                .frame(width: rdChipType.textSize)
            
            Text(title)
                .foregroundColor(.platinum950)
                .font(.system(size: rdChipType.textSize, weight: .regular))
            
            Text("\(chipValue)")
                .foregroundColor(.platinum950)
                .font(.system(size: rdChipType.spaceArounded.badgeTextSize, weight: .regular))
                .padding(.horizontal, rdChipType.spaceArounded.badgeTextHorizontalSpacing)
                .background(Color.chipBorderColor)
                .cornerRadius(20)
        }
        .padding(.vertical, rdChipType.spaceArounded.vertical)
        .padding(.horizontal, rdChipType.spaceArounded.horizontal)
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
