//
//  File.swift
//  
//
//  Created by Pranav Suri on 2024-07-30.
//

import Foundation
import SwiftUI

public struct NunitoSansFont {
    public let name: String

    private init(named name: String) {
        self.name = name
        do {
            try registerFont(named: name)
        } catch {
            let reason = error.localizedDescription
            fatalError("Failed to register font: \(reason)")
        }
    }
}

extension Font {
    
    public struct NunitoSans {
        
        /// Returns a font of the specified style and size, with optional weight and design.
        public static func rdTitleLarge() -> Font {
            return 
                .custom("NunitoSans-12ptExtraLight_Regular", size: 60)
                .bold()
        }
    }
}
