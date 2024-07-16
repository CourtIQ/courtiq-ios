//
//  WinReason.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - WinReason Enum

/// Represents the reason for winning a point in tennis.
///
/// The reasons can include ace, winner, forced error, unforced error, error, and double fault.
public enum PointWinReason: String, Codable, CustomStringConvertible, CaseIterable {
    
    /// An ace.
    case ace = "A"
    
    /// A winner.
    case winner = "W"
    
    /// A forced error.
    case forced = "F"
    
    /// An unforced error.
    case unforced = "U"
    
    /// An error.
    case error = "E"
    
    /// A double fault.
    case doubleFault = "DF"
    
    // MARK: - Description

    /// Provides a human-readable description of the win reason.
    ///
    /// - Returns: A string describing the win reason.
    public var description: String {
        switch self {
        case .ace:
            return "Ace"
        case .winner:
            return "Winner"
        case .forced:
            return "Forced Error"
        case .unforced:
            return "Unforced Error"
        case .error:
            return "Error"
        case .doubleFault:
            return "Double Fault"
        }
    }
    
    // MARK: - Code
    
    /// Provides the code representation of the win reason.
    ///
    /// - Returns: A string representing the win reason code.
    public var code: String {
        return self.rawValue
    }
    
    // MARK: - Init from Code
    
    /// Initializes a `WinReason` from a code.
    ///
    /// - Parameter code: A string representing the win reason code.
    /// - Returns: A `WinReason` instance if the code is valid, otherwise nil.
    public static func fromCode(_ code: String) -> PointWinReason? {
        return PointWinReason(rawValue: code)
    }
}
