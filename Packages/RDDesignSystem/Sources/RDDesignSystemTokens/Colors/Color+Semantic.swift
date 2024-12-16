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
        public static var `default`: Color {
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }
        public static var primary: Color {
            Color(light: Color.Token.platinum500, dark: Color.Token.platinum400)
        }
        public static var secondary: Color {
            Color(light: Color.Token.platinum100, dark: Color.Token.platinum900)
        }
        public static var tertiary: Color {
            Color(light: Color.Token.greyWhite, dark: Color.Token.grey800)
        }
        public static var color: Color {
            Color(light: Color.Token.greyWhite, dark: Color.Token.greyWhite)
        }
        public static var disabled: Color {
            Color(light: Color.Token.platinum200, dark: Color.Token.platinum700)
        }
        public static var success: Color {
            Color(light: Color.Token.green100, dark: Color.Token.green600)
        }
        public static var warning: Color {
            Color(light: Color.Token.orange200, dark: Color.Token.orange600)
        }
        public static var error: Color {
            Color(light: Color.Token.red100, dark: Color.Token.red500)
        }
    }
    
    struct Icon {
        public static var `default`: Color {
            Color(light: Color.Token.platinum950, dark: Color.Token.platinum50)
        }

        public static var inverted: Color {
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }
        
        public static var secondary: Color {
            Color(light: Color.Token.platinum500, dark: Color.Token.platinum400)
        }
        
        public static var primary: Color {
            Color(light: Color.Token.platinum700, dark: Color.Token.platinum200)
        }
    }

    struct Border {
        public static var `default`: Color {
            Color(light: Color.Token.platinum300, dark: Color.Token.platinum700)
        }
        
        public static var primary: Color {
            Color(light: Color.Token.platinum500, dark: Color.Token.platinum400)
        }
        
        public static var emphasis: Color {
            Color(light: Color.Token.platinum950, dark: Color.Token.platinum50)
        }
        
        public static var focused: Color {
            Color(light: Color.Token.purple500, dark: Color.Token.purple500)
        }

        public static var secondary: Color {
            Color(light: Color.Token.platinum500, dark: Color.Token.platinum400)
        }

        public static var success: Color {
            Color(light: Color.Token.green700, dark: Color.Token.green600)
        }

        public static var error: Color {
            Color(light: Color.Token.red500, dark: Color.Token.red500)
        }

        public static var disabled: Color {
            Color(light: .clear, dark: .clear)
        }
    }
    
    struct Text {
        public static var `default`: Color {
            Color(light: Color.Token.platinum950, dark: Color.Token.platinum50)
        }
        public static var primary: Color {
            Color(light: Color.Token.platinum700, dark: Color.platinum200)
        }
        public static var secondary: Color {
            Color(light: Color.Token.platinum500, dark: Color.Token.platinum400)
        }
        public static var inverted: Color {
            Color(light: Color.Token.platinum50, dark: Color.Token.platinum950)
        }
        public static var focused: Color {
            Color(light: Color.Token.greyWhite, dark: Color.Token.greyWhite)
        }
        public static var error: Color {
            Color(light: Color.Token.red600, dark: Color.Token.red100)
        }
        public static var success: Color {
            Color(light: Color.Token.green700, dark: Color.Token.green50)
        }
        public static var warning: Color {
            Color(light: Color.Token.orange700, dark: Color.Token.orange100)
        }
    }
}
