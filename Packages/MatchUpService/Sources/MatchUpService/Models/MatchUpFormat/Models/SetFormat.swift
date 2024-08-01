//
//  SetFormat.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - SetFormat Struct

/// Represents the format of a set in a tennis match.
///
/// The format includes the number of games required to win a set, whether a player must win by a margin of two games,
/// an optional tiebreak format, and an optional tiebreak trigger.
public struct SetFormat: Codable {
    
    // MARK: - Properties
    
    /// The number of games required to win a set.
    ///
    /// This determines how many games a player needs to win in order to win a set.
    public var numberOfGames: NumberOfGames

    /// The type of deuce rule applied in the game.
    ///
    /// This determines the rules for resolving a deuce (40-40) situation in a game.
    public var deuceType: DeuceType

    /// Indicates whether a player must win by a margin of two games.
    ///
    /// This rule applies to ensure that a player must win by at least two games to secure the set.
    public var mustWinByTwo: Bool
    
    /// The format of the tiebreak in the set.
    ///
    /// Includes the number of points required to win a tiebreak, the number of games
    /// at which the tiebreak is triggered, and whether a player must win by a margin of two points.
    /// This value is optional because not all set formats use tiebreaks.
    public var tiebreakFormat: TiebreakFormat?
    
    /// The number of games required before a tiebreak is played.
    ///
    /// This determines when a tiebreak is triggered in a set. For example, a tiebreak
    /// might be triggered at 6 games all. This value is optional because not all set formats use tiebreaks.
    public var tiebreakAt: Int?
    
    // MARK: - Initializer
    
    /// Initializes a new `SetFormat` with the specified parameters.
    ///
    /// - Parameters:
    ///   - numberOfGames: The number of games required to win a set.
    ///   - mustWinByTwo: Indicates whether a player must win by a margin of two games.
    ///   - tiebreakFormat: The format of the tiebreak in the set.
    ///   - tiebreakAt: The number of games required before a tiebreak is played.
    public init(numberOfGames: NumberOfGames, deuceType: DeuceType, mustWinByTwo: Bool, tiebreakFormat: TiebreakFormat? = nil, tiebreakAt: Int? = nil) {
        self.numberOfGames = numberOfGames
        self.deuceType = deuceType
        self.mustWinByTwo = mustWinByTwo
        self.tiebreakFormat = tiebreakFormat
        self.tiebreakAt = mustWinByTwo ? tiebreakAt : nil
    }
}
