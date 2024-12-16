//
//  CountryManager.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-11.
//

import Foundation
import SwiftUI

// MARK: - Country Struct
struct Country: Identifiable, Hashable {
    let id = UUID()
    let code: String
    let name: String
    let flag: String
}

// MARK: - CountryManager Class
class CountryManager {
    
    // Singleton instance
    static let shared = CountryManager()
    
    private init() {} // Prevent external instantiation
    
    // MARK: - Methods
    
    /// Returns a list of all countries with their codes, names, and flags.
    func getAllCountries() -> [Country] {
        return NSLocale.isoCountryCodes.compactMap { code in
            guard let name = self.getCountryName(from: code),
                  let flag = self.getCountryFlag(fromCode: code) else {
                return nil
            }
            return Country(code: code, name: name, flag: flag)
        }.sorted { $0.name < $1.name } // Sort alphabetically by country name
    }
    
    /// Converts a country code (e.g., "US") to a country name (e.g., "United States").
    func getCountryName(from code: String) -> String? {
        return NSLocale.current.localizedString(forRegionCode: code)
    }
    
    /// Converts a country code (e.g., "US") to a country flag emoji (e.g., "🇺🇸").
    func getCountryFlag(fromCode code: String) -> String? {
        return codeToFlagEmoji(code: code)
    }
    
    /// Converts a country name to its corresponding country code.
    func getCountryCode(fromName name: String) -> String? {
        let locale = Locale(identifier: "en_US")
        return Locale.isoRegionCodes.first { code in
            locale.localizedString(forRegionCode: code) == name
        }
    }

    
    /// Converts a country name to its corresponding flag emoji.
    func getCountryFlag(fromName name: String) -> String? {
        guard let code = getCountryCode(fromName: name) else {
            return nil
        }
        return getCountryFlag(fromCode: code)
    }
    
    /// Converts a country flag emoji to an Image object.
    func getCountryFlagImage(fromCode code: String, fontSize: CGFloat = 40) -> Image? {
        if let flag = getCountryFlag(fromCode: code) {
            return imageFromText(flag, fontSize: fontSize)
        }
        return nil
    }
    
    // MARK: - Private Methods
    
    /// Converts a country code to a flag emoji.
    private func codeToFlagEmoji(code: String) -> String? {
        guard code.count == 2 else { return nil }
        let base: UInt32 = 127397
        var scalarView = String.UnicodeScalarView()
        for scalar in code.uppercased().unicodeScalars {
            guard let scalar = UnicodeScalar(base + scalar.value) else { return nil }
            scalarView.append(scalar)
        }
        return String(scalarView)
    }
    
    /// Converts a Text (e.g., flag emoji) to a SwiftUI Image.
    private func imageFromText(_ text: String, fontSize: CGFloat = 40) -> Image? {
        let nsString = NSString(string: text)
        let font = UIFont.systemFont(ofSize: fontSize)
        let size = nsString.size(withAttributes: [.font: font])
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        UIColor.clear.set()
        
        nsString.draw(at: CGPoint.zero, withAttributes: [.font: font])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let uiImage = image {
            return Image(uiImage: uiImage)
        } else {
            return nil
        }
    }
}
