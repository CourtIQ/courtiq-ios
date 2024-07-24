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
            Color(light: Color.Token.platinumPlatinum50, dark: Color.Token.platinum950)
        }
        public static var backgroundDisabled: Color {
            Color(light: Color.Token.platinumPlatinum50, dark: Color.Token.platinum950)
        }

        public static var value: Color {
            Color(light: Color.Token.platinumPlatinum50, dark: Color.Token.platinum950)
        }
        
        public static var title: Color {
            Color(light: Color.Token.platinumPlatinum50, dark: Color.Token.platinum950)
        }
        
        public static var helperText: Color {
            Color(light: Color.Token.platinumPlatinum50, dark: Color.Token.platinum950)
        }
        
        public static var borderDefault: Color {
            Color(light: Color.Token.platinumPlatinum50, dark: Color.Token.platinum950)
        }
        
        public static var borderSuccess: Color {
            Color(light: Color.Token.platinumPlatinum50, dark: Color.Token.platinum950)
        }
    
        public static var borderError: Color {
            Color(light: Color.Token.platinumPlatinum50, dark: Color.Token.platinum950)
        }

        public static var borderDisabled: Color {
            Color(light: Color.Token.platinumPlatinum50, dark: Color.Token.platinum950)
        }
    }
}
