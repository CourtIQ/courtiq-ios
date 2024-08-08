//
//  RDIconButton.swift
//
//
//  Created by Pranav Suri on 06/12/2024.
//

import SwiftUI

// MARK: - RDIconButton

/// A customizable icon button for different types and sizes.
@available(iOS 15.0.0, *)
public struct RDIconButton: View {
    // MARK: - Properties
    
    /// The type of the icon button.
    public enum IconButtonType {
        case primary
        case secondary
        case tertiary
        case ghost
    }
    
    /// The size of the icon button.
    public enum IconButtonSize {
        case extraLarge
        case large
        case medium
        case small
    }
    
    var type: IconButtonType
    var size: IconButtonSize
    let icon: Image
    var disable: Bool
    var action: (() -> ())?
    
    // MARK: - Initializer
    
    /// Initializes a new `RDIconButton`.
    ///
    /// - Parameters:
    ///   - type: The type of the icon button.
    ///   - size: The size of the icon button.
    ///   - icon: The icon image to display.
    ///   - disable: A boolean indicating whether the button is disabled.
    ///   - action: An optional closure to execute when the button is pressed.
    public init(
        _ type: IconButtonType = .primary,
        _ size: IconButtonSize = .extraLarge,
        _ icon: Image,
        _ disable: Bool = false,
        action: (() -> ())? = nil
    ) {
        self.type = type
        self.size = size
        self.icon = icon
        self.disable = disable
        self.action = action
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button {
            action?()
        } label: {
            icon
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .padding(8)
                .foregroundColor(disable ? type.disabledIconColor : type.iconColor)
                .background(disable ? type.disabledBgColor : type.bgColor)
                .cornerRadius(size.cornerRadius)
                .overlay {
                    if type != .ghost {
                        RoundedRectangle(cornerRadius: size.cornerRadius)
                            .stroke(type.borderColor)
                    }
                }
        }
        .frame(width: size.size, height: size.size)
        .disabled(disable)
    }
}

// MARK: - Extensions for IconButtonSize

@available(iOS 13.0, *)
extension RDIconButton.IconButtonSize {
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
    
    var cornerRadius: CGFloat {
        return 8
    }
}

// MARK: - Extensions for IconButtonType

@available(iOS 13.0, *)
extension RDIconButton.IconButtonType {
    var iconColor: Color {
        switch self {
        case .primary:
            return Color.TokenColor.Semantic.Icon.inverted
        case .secondary:
            return Color.TokenColor.Semantic.Icon.primary
        case .tertiary:
            return Color.TokenColor.Semantic.Icon.default
        case .ghost:
            return Color.TokenColor.Semantic.Icon.secondary
        }
    }
    
    var bgColor: Color {
        switch self {
        case .primary:
            return Color.TokenColor.Semantic.Background.primary
        case .secondary:
            return Color.TokenColor.Semantic.Background.secondary
        case .tertiary, .ghost:
            return Color.TokenColor.Semantic.Background.default
        }
    }
    
    var pressedIconColor: Color {
        switch self {
        case .primary:
            return Color.TokenColor.Semantic.Icon.inverted
        case .secondary:
            return Color.TokenColor.Semantic.Icon.primary
        case .tertiary:
            return Color.TokenColor.Semantic.Icon.default
        case .ghost:
            return Color.TokenColor.Semantic.Icon.secondary
        }
    }
    
    var pressedBgColor: Color {
        switch self {
        case .primary:
            return Color.TokenColor.Semantic.Background.primary
        case .secondary:
            return Color.TokenColor.Semantic.Background.secondary
        case .tertiary:
            return Color.TokenColor.Semantic.Background.default
        case .ghost:
            return .clear
        }
    }
    
    var disabledIconColor: Color {
        return Color.TokenColor.Semantic.Background.disabled
    }
    
    var disabledBgColor: Color {
        switch self {
        case .primary, .secondary:
            return Color.TokenColor.Semantic.Background.disabled
        case .tertiary, .ghost:
            return .clear
        }
    }
    
    var borderColor: Color {
        switch self {
        case .primary, .ghost:
            return .clear
        case .secondary:
            return Color.TokenColor.Semantic.Border.primary
        case .tertiary:
            return Color.TokenColor.Semantic.Border.emphasis
        }
    }
}

// MARK: - RDActionIcon View

public struct RDActionIcon: View {
    let image: Image
    let action: () -> Void

    public init(image: Image, action: @escaping () -> Void) {
        self.image = image
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .foregroundColor(Color.TokenColor.Semantic.Icon.secondary)
        }
    }
}

// MARK: - Image Extension

public extension Image {
    func rdActionIcon(action: @escaping () -> Void) -> some View {
        RDActionIcon(image: self, action: action)
    }
}

