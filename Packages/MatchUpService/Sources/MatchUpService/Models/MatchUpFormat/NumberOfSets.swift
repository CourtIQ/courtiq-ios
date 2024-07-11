//
//  NumberOfSets.swift
//  
//
//  Created by Pranav Suri on 2024-07-10.
//

import Foundation

/// Represents the number of sets in a tennis match.
///
/// The number of sets in a match determines how many sets a player needs to win
/// in order to win the match. The match can be a single set, best of three sets,
/// or best of five sets.
public enum NumberOfSets: Int, CustomStringConvertible, Codable, CaseIterable {
    
    /// A match with a single set.
    ///
    /// The player who wins this set wins the match.
    case one = 1
    
    /// A match with the best of three sets.
    ///
    /// The player who wins two out of three sets wins the match.
    case three = 3
    
    /// A match with the best of five sets.
    ///
    /// The player who wins three out of five sets wins the match.
    case five = 5
    
    /// A textual description of the number of sets.
    ///
    /// This provides a human-readable description of the enum value.
    public var description: String {
        switch self {
        case .one:
            return "Single Set"
        case .three:
            return "Best of 3"
        case .five:
            return "Best of 5"
        }
    }
}
