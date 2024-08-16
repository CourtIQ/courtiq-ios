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
    
    struct SearchField {
        public static var background: Color {
            Color(light: Color.Token.platinum100, dark: Color.Token.platinum900)
        }
    }
    
    struct StatCard {
        public static var secondaryBackground: Color {
            Color(light: Color.Token.purple500, dark: Color.Token.purple700)
        }
    }
}
