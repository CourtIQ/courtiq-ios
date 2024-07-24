//
//  NunitoSans.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-18.
//

import Foundation
import SwiftUI

enum NunitoSans: String {
    case regular = "NunitoSans-12ptExtraLight_Regular"
    case light = "NunitoSans-12ptExtraLight_Light"
    case medium = "NunitoSans-12ptExtraLight_Medium"
    case semiBold = "NunitoSans-12ptExtraLight_SemiBold"
    case bold = "NunitoSans-12ptExtraLight_Bold"
    case extraBold = "NunitoSans-12ptExtraLight_ExtraBold"
    case black = "NunitoSans-12ptExtraLight_Black"
    
    var weight: String {
        return self.rawValue
    }
    
    func font(size: CGFloat) -> Font {
        return Font.custom(self.rawValue, size: size)
    }
}

extension Text {
    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 60` and `bold`
     */
    func rdTitle1() -> Text {
        font(Font.custom(NunitoSans.bold.rawValue, size: 60))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 48` and `bold`
     */
    func rdTitle2() -> Text {
        font(Font.custom(NunitoSans.bold.weight, size: 48))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 34` and `black`
     */
    func rdTitle3() -> Text {
        font(Font.custom(NunitoSans.black.weight, size: 34))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 24` and `bold`
     */
    func rdHeadline() -> Text {
        font(Font.custom(NunitoSans.bold.weight, size: 24))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 18` and `bold`
     */
    func rdSubheadline() -> Text {
        font(Font.custom(NunitoSans.bold.weight, size: 18))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 16` and `regular`
     */
    func rdBody() -> Text {
        font(Font.custom(NunitoSans.regular.weight, size: 16))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 16` and `semibold`
     */
    func rdBodyBold() -> Text {
        font(Font.custom(NunitoSans.semiBold.weight, size: 16))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 14` and `regular`
     */
    func rdSmallBody() -> Text {
        font(Font.custom(NunitoSans.regular.weight, size: 14))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 14` and `bold`
     */
    func rdSmallBodyBold() -> Text {
        font(Font.custom(NunitoSans.bold.weight, size: 14))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 12` and `semibold`
     */
    func rdCaption() -> Text {
        font(Font.custom(NunitoSans.semiBold.weight, size: 12))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 16` and `semibold`
     */
    func rdButtonLarge() -> Text {
        font(Font.custom(NunitoSans.semiBold.weight, size: 16))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 14` and `bold`
     */
    func rdButtonMedium() -> Text {
        font(Font.custom(NunitoSans.bold.weight, size: 14))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 12` and `bold`
     */
    func rdButtonSmall() -> Text {
        font(Font.custom(NunitoSans.bold.weight, size: 12))
    }
}



