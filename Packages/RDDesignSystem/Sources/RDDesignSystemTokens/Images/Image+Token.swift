//
//  File.swift
//  
//
//  Created by Pranav Suri on 2024-08-06.
//

import Foundation

import SwiftUI

public extension Image {
    public struct Token {
        public struct Icons {
            
            public static var envelope: Image {
                Image("mail", bundle: .module)
            }
            
            public static var unlocked: Image {
                Image("lock-open", bundle: .module)
            }
            
            public static var locked: Image {
                Image("lock-close", bundle: .module)
            }
            
            public static var eyeOpen: Image {
                Image("invisible", bundle: .module)
            }
            
            public static var eyeClosed: Image {
                Image("visible", bundle: .module)
            }
            
            public static var person: Image {
                Image("user", bundle: .module)
            }
            
            public static var close: Image {
                Image("cross", bundle: .module)
            }
        }
    }
}
