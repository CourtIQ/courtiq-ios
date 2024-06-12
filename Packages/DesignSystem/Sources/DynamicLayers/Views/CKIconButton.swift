//
//  CKIconButton.swift
//  
//
//  Created by DynamicLayers on 05/11/2023.
//

import SwiftUI

@available(iOS 13.0, *)
public enum CKIconButtonSize {
    case extraLarge
    case large
    case medium
    case small
    
    var size: CGFloat {
        switch self {
        case .extraLarge:
            return 56
        case .large:
            return 48
        case .medium:
            return 40
        case .small:
            return 32
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

@available(iOS 13.0, *)
public enum CKIconButtonType {
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
            return .platinum100
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

@available(iOS 13.0, *)
struct CKIconButtonPressedStyle: ButtonStyle {
    var buttonSize: CKIconButtonSize
    var buttonType: CKIconButtonType
    var disable: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(disable ? buttonType.disabledIconColor : (configuration.isPressed ? buttonType.pressedIconColor : buttonType.iconColor))
            .background(disable ? buttonType.disabledBgColor : (configuration.isPressed ? buttonType.pressedBgColor : buttonType.bgColor))
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

@available(iOS 15.0.0, *)
public struct CKIconButton: View {
    var type: CKIconButtonType
    var size: CKIconButtonSize
    let icon: String
    var disable: Bool
    var action: (()->())?
    
    public init(
        _ type: CKIconButtonType = .primary,
        _ size: CKIconButtonSize = .extraLarge,
        _ icon: String,
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
        Button{
            action?()
        } label: {
            Image(icon)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .frame(width: size.size, height: size.size)
        }
        .buttonStyle(
            CKIconButtonPressedStyle(
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
