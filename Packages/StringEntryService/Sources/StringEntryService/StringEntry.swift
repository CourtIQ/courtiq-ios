//
//  StringEntry.swift
//
//
//  Created by Pranav Suri on 2024-07-31.
//

import Foundation

public struct StringEntry: Codable {
    public var id: String
    public var userID: String
    public var stringName: String
    public var racketName: String
    public var stringingDate: Date
    public var stringMainsTension: Int
    public var stringCrossTensions: Int
    public var lastUpdated: Date
    public var entryDate: Date
    
    public init(
        id: String = UUID().uuidString,
        userID: String = "",
        stringName: String = "",
        racketName: String = "",
        stringingDate: Date = Date(),
        stringMainsTension: Int = 50,
        stringCrossTensions: Int = 50,
        lastUpdated: Date = Date(),
        entryDate: Date = Date()
    ) {
        self.id = id
        self.userID = userID
        self.stringName = stringName
        self.racketName = racketName
        self.stringingDate = stringingDate
        self.stringMainsTension = stringMainsTension
        self.stringCrossTensions = stringCrossTensions
        self.lastUpdated = lastUpdated
        self.entryDate = entryDate
    }
}
// TODO: Fix the document ID not being the same
