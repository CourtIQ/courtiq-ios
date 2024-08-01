//
//  Color+Component.swift
//
//
//  Created by Pranav Suri on 2024-07-24.
//

import Foundation
import SwiftUI

// MARK: - Color.TokenColors.Semantic

public extension Color.TokenColor.Component {
    
    // MARK: Background
    
    struct TextField {
        public static var background: Color {
            Color(light: Color.Token.greyWhite, dark: Color.Token.grey900)
        }

        public static var foreground: Color {
            Color(light: Color.Token.greyWhite, dark: Color.Token.grey900)
        }

        public static var backgroundDisabled: Color {
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }

        public static var foregroundDisabled: Color {
            Color(light: Color.Token.grey400, dark: Color.Token.grey400)
        }

        public static var borderDefault: Color {
            Color(light: Color.Token.platinum300, dark: Color.Token.platinum400)
        }

        public static var borderFocused: Color {
            Color(light: Color.Token.purple800, dark: Color.Token.purple600)
        }

        public static var borderDisabled: Color {
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }

        public static var borderSuccess: Color {
            Color(light: Color.Token.green800, dark: Color.Token.green600)
        }
    
        public static var borderError: Color {
            Color(light: Color.Token.red700, dark: Color.Token.red600)
        }

        public static var value: Color {
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }
        
        public static var title: Color {
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }
        
        public static var helperTextDefault: Color {
            Color(light: Color.Token.platinum500, dark: Color.Token.platinum300)
        }
        public static var helperTextSuccess: Color {
            Color(light: Color.Token.green800, dark: Color.Token.green600)
        }
        public static var helperTextError: Color {
            Color(light: Color.Token.red700, dark: Color.Token.red600)
        }
    }
}
