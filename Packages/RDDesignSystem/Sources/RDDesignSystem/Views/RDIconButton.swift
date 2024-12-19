//
//  RDActionIcon.swift
//
//
//  Created by Pranav Suri on 06/12/2024.
//

import SwiftUI

@available(iOS 15.0.0, *)
public struct RDActionIcon: View {
    // MARK: - Properties
    public enum IconButtonType {
        case primary
        case secondary
        case tertiary
        case ghost
    }
    
    public enum IconButtonSize {
        case extraLarge
        case large
        case medium
        case small
    }
    
    let type: IconButtonType
    let size: IconButtonSize
    let image: Image
    let action: () -> Void
    
    // MARK: - Initializer
    /// Initializes a new `RDActionIcon`.
    ///
    /// - Parameters:
    ///   - type: The type of the icon (primary, secondary, tertiary, ghost).
    ///   - size: The size of the icon (optional, default is `.extraLarge`).
    ///   - image: The image to display (required).
    ///   - action: The closure to execute when tapped (required).
    public init(
        type: IconButtonType = .ghost,
        size: IconButtonSize = .extraLarge,
        image: Image,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.size = size
        self.image = image
        self.action = action
    }
    
    // MARK: - Body
    public var body: some View {
        Button(action: action) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: size.iconSize, height: size.iconSize)
                .padding(8)
                .foregroundColor(type.iconColor)
                .background(type.bgColor)
                .cornerRadius(size.cornerRadius)
                .overlay {
                    if type != .ghost {
                        RoundedRectangle(cornerRadius: size.cornerRadius)
                            .stroke(type.borderColor)
                    }
                }
        }
        .frame(width: size.size, height: size.size)
    }
}

// MARK: - Extensions for IconButtonSize
extension RDActionIcon.IconButtonSize {
    var size: CGFloat {
        switch self {
        case .extraLarge:
            return 48
        case .large:
            return 36
        case .medium:
            return 32
        case .small:
            return 24
        }
    }
    
    var iconSize: CGFloat {
        return size * 0.8
    }
    
    var cornerRadius: CGFloat {
        return 8
    }
}

// MARK: - Extensions for IconButtonType
extension RDActionIcon.IconButtonType {
    var iconColor: Color {
        switch self {
        case .primary:
            return Color.TokenColor.Semantic.Icon.inverted
        case .secondary:
            return Color.TokenColor.Semantic.Icon.secondary
        case .tertiary:
            return Color.TokenColor.Semantic.Icon.default
        case .ghost:
            return Color.TokenColor.Semantic.Icon.primary
        }
    }
    
    var bgColor: Color {
        switch self {
        case .primary:
            return Color.TokenColor.Semantic.Background.primary
        case .secondary:
            return Color.TokenColor.Semantic.Background.secondary
        case .tertiary, .ghost:
            return .clear
        }
    }
    
    var borderColor: Color {
        switch self {
        case .primary, .ghost:
            return .clear
        case .secondary:
            return Color.TokenColor.Semantic.Border.default
        case .tertiary:
            return Color.TokenColor.Semantic.Border.emphasis
        }
    }
}
