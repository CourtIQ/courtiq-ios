//
//  GameFormat.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - GameFormat Struct

/// Represents the format of a game in a tennis match.
///
/// The format includes the number of games required to win a set, the type of deuce rule applied,
/// and whether a player must win by a margin of two games.
public struct GameFormat: Codable {
    
    // MARK: - Properties

    /// The number of games required to win a set.
    ///
    /// This determines how many games a player needs to win in order to win a set. The value
    /// ranges from one to ten games.
    public var numberOfGames: NumberOfGames
    
    /// The type of deuce rule applied in the game.
    ///
    /// This determines the rules for resolving a deuce (40-40) situation in a game.
    public var deuceType: DeuceType
    
    /// Indicates whether a player must win by a margin of two games.
    ///
    /// This rule applies to ensure that a player must win by at least two games to secure the set.
    public var mustWinByTwo: Bool
    
    // MARK: - Initializer
    
    /// Initializes a new `GameFormat` with the specified parameters.
    ///
    /// - Parameters:
    ///   - numberOfGames: The number of games required to win a set.
    ///   - deuceType: The type of deuce rule applied in the game.
    ///   - mustWinByTwo: Indicates whether a player must win by a margin of two games.
    public init(numberOfGames: NumberOfGames, deuceType: DeuceType, mustWinByTwo: Bool) {
        self.numberOfGames = numberOfGames
        self.deuceType = deuceType
        self.mustWinByTwo = mustWinByTwo
    }
}
