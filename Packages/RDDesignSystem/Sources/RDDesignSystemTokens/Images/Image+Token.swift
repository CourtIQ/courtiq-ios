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
                Image("close", bundle: .module)
            }
            
            public static var back: Image {
                Image("chevron-left", bundle: .module)
            }
            
            public static var menu: Image {
                Image("menu", bundle: .module)
            }
            
            public static var add: Image {
                Image("add", bundle: .module)
            }
            
            public static var settings: Image {
                Image("settings", bundle: .module)
            }

            public static var home: Image {
                Image("home", bundle: .module)
            }
            
            public static var search: Image {
                Image("search", bundle: .module)
            }
            
            public static var tennisBall: Image {
                Image("tennis-ball", bundle: .module)
            }            
            
            public static var chevronRight: Image {
                Image("chevron-right", bundle: .module)
            }
            
            public static var filter: Image {
                Image("filter", bundle: .module)
            }

            public static var dropdown: Image {
                Image("chevrons-up-down", bundle: .module)
            }

            public static var cross: Image {
                Image("cross", bundle: .module)
            }

            public static var upload: Image {
                Image("upload", bundle: .module)
            }
            
            public static var flag: Image {
                Image("flag", bundle: .module)
            }
            
            public static var arrowUp: Image {
                Image("arrow-up", bundle: .module)
            }
            
            public static var bell: Image {
                Image("bell", bundle: .module)
            }
        }
    }
}
