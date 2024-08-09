//
//  SSMenuConfig.swift
//  SSSwiftUISideMenuDemo
//
//  Created by Parth Dumaswala on 31/10/23.
//

import Foundation
import SwiftUI

public enum Directions {
    case left, right
}

struct SideMenuConfig {
    private(set) var menuWidth: CGFloat
    /** Open / Close animation of the sidemenu. Default animation is there.**/
    private(set) var animationType: Animation
    /** Specify the Sidemenu direction form open . Default is: left**/
    private(set) var menuDirection: Directions
    /** Boolean for whether you want the menu close on swipe gesture . Default is: Enabled**/
    private(set) var swipeToClose: Bool
    /** Boolean for whether you want the close the menu on tap gesture(out side) . Default is: Enabled**/
    private(set) var tapToClose: Bool
    /** Boolean for whether you want to show App version . Default is: False**/
    
    public init(
        menuWidth: CGFloat = 260,
        animationType: Animation = .default,
        menuDirection: Directions = .left,
        swipeToClose: Bool = true,
        tapToClose: Bool = true
    ) {
        self.menuWidth = menuWidth
        self.animationType = animationType
        self.menuDirection = menuDirection
        self.swipeToClose = swipeToClose
        self.tapToClose = tapToClose
    }
}
