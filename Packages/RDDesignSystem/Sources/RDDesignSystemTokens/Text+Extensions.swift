//
//  File.swift
//  
//
//  Created by Pranav Suri on 2024-07-30.
//

import Foundation
import SwiftUI

public extension Text {
    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 60` and `bold`
     */
    func rdTitle1() -> Text {
        font(Font
            .custom("NunitoSans", size: 60)
            .bold())
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 48` and `bold`
     */
    func rdTitle2() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 48)
            .bold())
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 34` and `black`
     */
    func rdTitle3() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 34)
            .weight(.black))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 24` and `bold`
     */
    func rdHeadline() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 24)
            .bold())
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 18` and `bold`
     */
    func rdSubheadline() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 18)
            .bold())
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 16` and `regular`
     */
    func rdBody() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 16))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 16` and `semibold`
     */
    func rdBodyBold() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_SemiBold", size: 16))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 14` and `regular`
     */
    func rdSmallBody() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 14))
    }
    
    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 14` and `regular`
     */
    func rdExtraSmallBody() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 10))
    }
    
    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 14` and `bold`
     */
    func rdSmallBodyBold() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 14)
            .bold())
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 12` and `semibold`
     */
    func rdCaption() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 12)
            .weight(.semibold))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 16` and `semibold`
     */
    func rdButtonLarge() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 16)
            .weight(.semibold))
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 14` and `bold`
     */
    func rdButtonMedium() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 14)
            .bold())
    }

    /**
     Modify the Text.

     - Returns: A new `Text` with `font size 12` and `bold`
     */
    func rdButtonSmall() -> Text {
        font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 12)
            .bold())
    }
}

struct RDTitle1Modifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Black", size: 60))
    }
}

struct RDTitle2Modifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_ExtraBold", size: 48))
    }
}

struct RDTitle3Modifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Bold", size: 34))
    }
}

struct RDHeadlineModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Bold", size: 24))
    }
}

struct RDSubheadlineModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_SemiBold", size: 18))
    }
}

struct RDBodyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 16))
    }
}

struct RDBodyBoldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Bold", size: 16))
    }
}

struct RDSmallBodyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Regular", size: 14))
    }
}

struct RDSmallBodyBoldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Bold", size: 14))
    }
}

struct RDCaptionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_SemiBold", size: 12))
    }
}

struct RDButtonLargeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_SemiBold", size: 16))
    }
}

struct RDButtonMediumModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Bold", size: 14))
    }
}

struct RDButtonSmallModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Bold", size: 12))
    }
}

struct RDExtraLightModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight", size: size))
    }
}

struct RDLargeModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Light", size: size))
    }
}

struct RDMediumModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Medium", size: size))
    }
}

struct RDSemiBoldModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_SemiBold", size: size))
    }
}

struct RDBoldModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Bold", size: size))
    }
}

struct RDExtraBoldModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_ExtraBold", size: size))
    }
}

struct RDBlackModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content.font(Font.custom("NunitoSans-12ptExtraLight_Black", size: size))
    }
}

struct DynamicFontModifier: ViewModifier {
    let fontName: String
    let size: CGFloat
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content.font(Font.custom(fontName, size: size).weight(weight))
    }
}

extension View {
    func dynamicFont(fontName: String, size: CGFloat, weight: Font.Weight) -> some View {
        self.modifier(DynamicFontModifier(fontName: fontName, size: size, weight: weight))
    }
}

extension View {
    func rdTitle1() -> some View {
        self.modifier(RDTitle1Modifier())
    }

    func rdTitle2() -> some View {
        self.modifier(RDTitle2Modifier())
    }

    func rdTitle3() -> some View {
        self.modifier(RDTitle3Modifier())
    }

    func rdHeadline() -> some View {
        self.modifier(RDHeadlineModifier())
    }

    func rdSubheadline() -> some View {
        self.modifier(RDSubheadlineModifier())
    }

    func rdBody() -> some View {
        self.modifier(RDBodyModifier())
    }

    func rdBodyBold() -> some View {
        self.modifier(RDBodyBoldModifier())
    }

    func rdSmallBody() -> some View {
        self.modifier(RDSmallBodyModifier())
    }

    func rdSmallBodyBold() -> some View {
        self.modifier(RDSmallBodyBoldModifier())
    }

    func rdCaption() -> some View {
        self.modifier(RDCaptionModifier())
    }

    func rdButtonLarge() -> some View {
        self.modifier(RDButtonLargeModifier())
    }

    func rdButtonMedium() -> some View {
        self.modifier(RDButtonMediumModifier())
    }

    func rdButtonSmall() -> some View {
        self.modifier(RDButtonSmallModifier())
    }
    
    func rdExtraLight(size: CGFloat) -> some View {
        self.modifier(RDExtraLightModifier(size: size))
    }

    func rdLight(size: CGFloat) -> some View {
        self.modifier(RDLargeModifier(size: size))
    }

    func rdMedium(size: CGFloat) -> some View {
        self.modifier(RDMediumModifier(size: size))
    }

    func rdSemiBold(size: CGFloat) -> some View {
        self.modifier(RDSemiBoldModifier(size: size))
    }

    func rdBold(size: CGFloat) -> some View {
        self.modifier(RDBoldModifier(size: size))
    }

    func rdExtraBold(size: CGFloat) -> some View {
        self.modifier(RDExtraBoldModifier(size: size))
    }

    func rdBlack(size: CGFloat) -> some View {
        self.modifier(RDBlackModifier(size: size))
    }

    func dynamicNunitoSans(size: CGFloat, weight: Font.Weight) -> some View {
        let fontName: String
        
        switch weight {
        case .ultraLight:
            fontName = "NunitoSans-12ptExtraLight_ExtraBold"
        case .thin:
            fontName = "NunitoSans-12ptExtraLight_Light"
        case .light:
            fontName = "NunitoSans-12ptExtraLight_Light"
        case .regular:
            fontName = "NunitoSans-12ptExtraLight_Regular"
        case .medium:
            fontName = "NunitoSans-12ptExtraLight_Medium"
        case .semibold:
            fontName = "NunitoSans-12ptExtraLight_SemiBold"
        case .bold:
            fontName = "NunitoSans-12ptExtraLight_Bold"
        case .heavy:
            fontName = "NunitoSans-12ptExtraLight_ExtraBold"
        case .black:
            fontName = "NunitoSans-12ptExtraLight_Black"
        default:
            fontName = "NunitoSans-12ptExtraLight_Regular"
        }
        
        return self.dynamicFont(fontName: fontName, size: size, weight: weight)
    }
}
