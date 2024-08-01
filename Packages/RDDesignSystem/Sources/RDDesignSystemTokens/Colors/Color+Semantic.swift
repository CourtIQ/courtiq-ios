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
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }

    }
    
    struct Label {
        public static var primary: Color {
            Color(light: Color.Token.platinum950, dark: Color.Token.platinum50)
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
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }
    }

    struct Border {
        public static var primary: Color {
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
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
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }
    }
}
