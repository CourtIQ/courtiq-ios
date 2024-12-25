//
//  RDButtonView.swift
//
//
//  Created by Pranav Suri on 06/12/2024.
//

import SwiftUI

// MARK: - ButtonSize
/// An enumeration representing various button sizes.
public enum ButtonSize {
    case extraLarge
    case large
    case medium
    case small
    
    /// Returns the height corresponding to the button size.
    var height: CGFloat {
        switch self {
        case .extraLarge:
            return 48
        case .large:
            return 40
        case .medium:
            return 32
        case .small:
            return 28
        }
    }
    
    /// Returns the corner radius for the button.
    var cornerRadius: CGFloat {
        return 30
    }
    
    /// Returns the text size corresponding to the button size.
    var textSize: CGFloat {
        switch self {
        case .small:
            return 14
        default:
            return 16
        }
    }
}

// MARK: - ButtonType
/// An enumeration representing various button types.
@available(iOS 13.0, *)
public enum RDButtonType {
    case primary
    case secondary
    case tertiary
    case ghost
    
    /// Returns the text color for the button type.
    var textColor: Color {
        switch self {
        case .primary:
            return Color.TokenColor.Semantic.Text.inverted
        case .secondary:
            return Color.TokenColor.Semantic.Text.primary
        case .tertiary:
            return Color.TokenColor.Semantic.Text.default
        case .ghost:
            return Color.TokenColor.Semantic.Text.secondary
        }
    }
    
    /// Returns the background color for the button type.
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

    /// Returns the icon color for the button type.
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

    /// Returns the border color for the button type.
    var borderColor: Color {
        switch self {
        case .primary, .ghost:
            return Color.clear
        case .secondary:
            return Color.TokenColor.Semantic.Border.primary
        case .tertiary:
            return Color.TokenColor.Semantic.Border.emphasis
        }
    }
    
    /// Indicates whether the button text should be underlined.
    var underline: Bool {
        switch self {
        case .ghost:
            return true
        default:
            return false
        }
    }
}

// MARK: - RDButtonView
/// A custom button view that supports various sizes, types, and configurations.
@available(iOS 15.0.0, *)
public struct RDButtonView: View {
    
    // MARK: Properties
    var buttonSize: ButtonSize
    var buttonType: RDButtonType
    var title: String
    var width: CGFloat
    var icon: (leadingIcon: Image, trailingIcon: Image)?
    private var leadingIcon: Image?
    private var trailingIcon: Image?
    var disable: Bool
    var action: (() -> ())?
    
    // MARK: Initializer
    /// Initializes a new `RDButtonView`.
    ///
    /// - Parameters:
    ///   - buttonSize: The size of the button.
    ///   - buttonType: The type of the button.
    ///   - title: The title of the button.
    ///   - width: The width of the button. Defaults to `.infinity`.
    ///   - icon: An optional tuple containing the leading and trailing icons.
    ///   - disable: A boolean indicating whether the button is disabled.
    ///   - action: An optional closure to execute when the button is tapped.
    public init(
        _ buttonSize: ButtonSize = .extraLarge,
        _ buttonType: RDButtonType = .primary,
        _ title: String,
        width: CGFloat = .infinity,
        icon: (leadingIcon: Image, trailingIcon: Image)? = nil,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        disable: Bool = false,
        action: (() -> Void)? = nil
    ) {
        self.buttonSize = buttonSize
        self.buttonType = buttonType
        self.title = title
        self.width = width
        self.icon = icon
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.disable = disable
        self.action = action
    }
    
    // MARK: Body
    public var body: some View {
        Button {
            action?()
        } label: {
            HStack {
                if let leadingIcon = leadingIcon {
                    leadingIcon
                        .resizable()
                        .foregroundColor(buttonType.iconColor)
                        .frame(width: 24, height: 24)
                }
                
                Text(title)
                    .rdButtonMedium()
                    .foregroundColor(buttonType.textColor)
                    .underline(buttonType.underline)
                
                if let trailingIcon = trailingIcon {
                    trailingIcon
                        .resizable()
                        .foregroundColor(buttonType.iconColor)
                        .frame(width: 24, height: 24)
                }
            }
            .frame(
                maxWidth: buttonType == .ghost ? nil : width,
                minHeight: buttonSize.height
            )
            .background(buttonType.bgColor)
            .clipShape(Capsule())
            .overlay {
                Capsule(style: .continuous)
                    .stroke(buttonType.borderColor, lineWidth: 1)
            }
        }
        .disabled(disable)
        .overlay {
            if disable {
                Color.black.opacity(0.4)
                    .clipShape(Capsule())
            }
        }
    }
}
