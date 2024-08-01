//
//  RDIconButton.swift
//
//
//  Created by Pranav Suri on 06/12/2024.
//

import SwiftUI

// MARK: - RDIconButtonSize
@available(iOS 13.0, *)
public enum RDIconButtonSize {
    case extraLarge
    case large
    case medium
    case small
    
    var size: CGFloat {
        switch self {
        case .extraLarge:
            return 48
        case .large:
            return 36
        case .medium:
            return 32
        case .small:
            return 28
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .extraLarge, .large:
            return 12
        default:
            return 8
        }
    }
}

// MARK: - RDIconButtonType
@available(iOS 13.0, *)
public enum RDIconButtonType {
    case primary
    case secondary
    case tertiary
    
    var iconColor: Color {
        switch self {
        case .primary:
            return .white
        case .secondary:
            return .purple500
        case .tertiary:
            return .platinum950
        }
    }
    
    var bgColor: Color {
        switch self {
        case .primary:
            return .purple500
        case .secondary:
            return .purple100
        case .tertiary:
            return .white
        }
    }
    
    var pressedIconColor: Color {
        switch self {
        case .primary:
            return .white
        case .secondary:
            return .purple500
        case .tertiary:
            return .platinum950
        }
    }
    
    var pressedBgColor: Color {
        switch self {
        case .primary:
            return .purple700
        case .secondary:
            return .purple200
        case .tertiary:
            return Color.TokenColor.Semantic.Background.primary
        }
    }
    
    var disabledIconColor: Color {
        switch self {
        case .primary, .secondary, .tertiary:
            return .platinum300
        }
    }
    
    var disabledBgColor: Color {
        switch self {
        case .primary, .secondary:
            return .platinum100
        default:
            return .clear
        }
    }
    
    var borderColor: Color {
        switch self{
        case .tertiary:
            return .platinum200
        default:
            return .clear
        }
    }
}

// MARK: - RDIconButtonPressedStyle
@available(iOS 13.0, *)
struct RDIconButtonPressedStyle: ButtonStyle {
    var buttonSize: RDIconButtonSize
    var buttonType: RDIconButtonType
    var disable: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(disable ? buttonType.disabledIconColor : (configuration.isPressed ? buttonType.pressedIconColor : buttonType.iconColor))
            .background(disable ? buttonType.disabledBgColor : (configuration.isPressed ? buttonType.pressedBgColor : buttonType.bgColor))
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

// MARK: - RDIconButton
@available(iOS 15.0.0, *)
public struct RDIconButton: View {
    var type: RDIconButtonType
    var size: RDIconButtonSize
    let icon: Image
    var disable: Bool
    var action: (() -> ())?
    
    public init(
        _ type: RDIconButtonType = .primary,
        _ size: RDIconButtonSize = .extraLarge,
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
    
    public var body: some View {
        Button {
            action?()
        } label: {
            icon
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(8)
        }
        .buttonStyle(
            RDIconButtonPressedStyle(
                buttonSize: size,
                buttonType: type,
                disable: disable
            )
        )
        .cornerRadius(size.cornerRadius)
        .overlay {
            RoundedRectangle(cornerRadius: size.cornerRadius)
                .stroke(type.borderColor)
        }
        .disabled(disable)
    }
}

// Usage Example

@available(iOS 15.0.0, *)
struct ContentView: View {
    var body: some View {
        RDIconButton(
            .primary,
            .extraLarge,
            Image(systemName: "bell.fill"),
            false,
            action: {
                print("Button pressed")
            }
        )
    }
}
