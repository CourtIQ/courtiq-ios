//
//  Color+Semantic.swift
//  
//
//  Created by Pranav Suri on 2024-07-24.
//

import Foundation
import SwiftUI

// MARK: - Color.TokenColors.Semantic

public extension Color.TokenColor.Semantic {
    
    // MARK: Background
    
    struct Background {
        public static var primary: Color {
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }

        public static var secondary: Color {
            Color(light: Color.Token.grey300, dark: Color.Token.platinum900)
        }
    
        public static var disabled: Color {
            Color(light: Color.Token.platinum200, dark: Color.Token.platinum700)
        }

    }
    
    struct Label {
        public static var primary: Color {
            Color(light: Color.Token.platinum950, dark: Color.Token.platinum50)
        }

        public static var secondary: Color {
            Color(light: Color.Token.platinum700, dark: Color.Token.platinum300)
        }

        public static var tertiary343434: Color {
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }

        public static var success: Color {
            Color(light: Color.Token.green800, dark: Color.Token.green600)
        }

        public static var error: Color {
            Color(light: Color.Token.red700, dark: Color.Token.red600)
        }

        public static var disabledPrimary: Color {
            Color(light: Color.Token.grey500, dark: Color.Token.grey500)
        }
    
        public static var disabledSecondary: Color {
            Color(light: Color.Token.grey500, dark: Color.Token.grey500)
        }
    }

    struct Border {
        public static var primary: Color {
            Color(light: Color.Token.platinum400, dark: Color.Token.platinum600)
        }
        
        public static var focused: Color {
            Color(light: Color.Token.purple500, dark: Color.Token.purple500)
        }

        public static var secondary: Color {
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }

        public static var success: Color {
            Color(light: Color.Token.green800, dark: Color.Token.green600)
        }

        public static var error: Color {
            Color(light: Color.Token.red700, dark: Color.Token.red600)
        }

        public static var disabled: Color {
            Color(light: .clear, dark: .clear)
        }
    }
}
// TODO: Update to do this structure
/*
 -> Semantic
        -> Background
        -> Text
        -> Border
        -> Icon
 */
