//
//  NumberOfGames.swift
//
//
//  Created by Pranav Suri on 2024-07-10.
//

import Foundation

// MARK: - NumberOfGames Enum

/// Represents the number of games in a set.
///
/// The number of games in a set determines how many games a player needs to win
/// in order to win the set. This enum allows specifying a range from one to ten games.
/// The set can either be won by being the first to reach the specified number of games,
/// or by continuing until one player wins by a margin of two games.
public enum NumberOfGames: Int, CustomStringConvertible, Codable, CaseIterable {
    
    /// One game in a set.
    ///
    /// The player who wins one game wins the set.
    case one = 1
    
    /// Two games in a set.
    ///
    /// The player who wins two games wins the set.
    case two = 2
    
    /// Three games in a set.
    ///
    /// The player who wins three games wins the set.
    case three = 3
    
    /// Four games in a set.
    ///
    /// The player who wins four games wins the set unless a win by two rule is in effect.
    case four = 4
    
    /// Five games in a set.
    ///
    /// The player who wins five games wins the set unless a win by two rule is in effect.
    case five = 5
    
    /// Six games in a set.
    ///
    /// The player who wins six games wins the set unless a win by two rule is in effect.
    case six = 6
    
    /// Seven games in a set.
    ///
    /// The player who wins seven games wins the set unless a win by two rule is in effect.
    case seven = 7
    
    /// Eight games in a set.
    ///
    /// The player who wins eight games wins the set unless a win by two rule is in effect.
    case eight = 8
    
    /// Nine games in a set.
    ///
    /// The player who wins nine games wins the set unless a win by two rule is in effect.
    case nine = 9
    
    /// Ten games in a set.
    ///
    /// The player who wins ten games wins the set unless a win by two rule is in effect.
    case ten = 10
    
    /// A textual description of the number of games.
    ///
    /// This provides a human-readable description of the enum value.
    public var description: String {
        return "\(self.rawValue) Game(s)"
    }
}
