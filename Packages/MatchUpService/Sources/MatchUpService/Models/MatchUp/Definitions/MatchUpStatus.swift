//
//  MatchUpStatus.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - MatchUpStatus Enum

/// Represents the status of a tennis match.
///
/// The statuses can include abandoned, bye, completed, dead rubber, defaulted,
/// in progress, not played, retired, suspended, to be played, and walkover.
public enum MatchUpStatus: String, Codable, CustomStringConvertible, CaseIterable {
    
    /// The match was abandoned.
    case abandoned = "ABN"
    
    /// The match was a bye.
    case bye = "BYE"
    
    /// The match was completed.
    case completed = "CO"
    
    /// The match was a dead rubber.
    case deadRubber = "DR"
    
    /// The match was defaulted.
    case defaulted = "DEF"
    
    /// The match is in progress.
    case inProgress = "IP"
    
    /// The match was not played.
    case notPlayed = "NP"
    
    /// A player retired from the match.
    case retired = "RET"
    
    /// The match was suspended.
    case suspended = "SUS"
    
    /// The match is to be played.
    case toBePlayed = "TBP"
    
    /// The match was a walkover.
    case walkover = "WO"
    
    // MARK: - Description
    
    /// Provides a human-readable description of the match status.
    ///
    /// - Returns: A string describing the match status.
    public var description: String {
        switch self {
        case .abandoned:
            return "Abandoned"
        case .bye:
            return "Bye"
        case .completed:
            return "Completed"
        case .deadRubber:
            return "Dead rubber"
        case .defaulted:
            return "Defaulted"
        case .inProgress:
            return "In progress"
        case .notPlayed:
            return "Not played"
        case .retired:
            return "Retired"
        case .suspended:
            return "Suspended"
        case .toBePlayed:
            return "To be played"
        case .walkover:
            return "Walkover"
        }
    }
    
    // MARK: - Code
    
    /// Provides the code representation of the match status.
    ///
    /// - Returns: A string representing the match status code.
    public var code: String {
        return self.rawValue
    }
}
