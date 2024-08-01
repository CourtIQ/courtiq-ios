//
//  StringEntry.swift
//
//
//  Created by Pranav Suri on 2024-07-31.
//

import Foundation

public struct StringEntry: Codable {
    var stringWEntryID: String
    var stringName: String
    var stringingDate: Date
    var stringMainsTension: Float
    var stringCrossTensions: Float
    var lastUpdated: Date
    var entryDate: Date
    
    init(stringWEntryID: String, stringName: String, stringingDate: Date, stringMainsTension: Float, stringCrossTensions: Float, lastUpdated: Date, entryDate: Date) {
        self.stringWEntryID = stringWEntryID
        self.stringName = stringName
        self.stringingDate = stringingDate
        self.stringMainsTension = stringMainsTension
        self.stringCrossTensions = stringCrossTensions
        self.lastUpdated = lastUpdated
        self.entryDate = entryDate
    }
}
