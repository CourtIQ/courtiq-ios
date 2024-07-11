//
//  MatchUpFormat.swift
//  
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

/// Represents the overall format of a tennis match.
///
/// The format includes the number of sets in the match, the format for each game,
/// and an optional tiebreak format.
public struct MatchUpFormat: Codable {
    
    /// The number of sets in the match.
    ///
    /// Determines how many sets a player needs to win to win the match.
    public var numberOfSets: NumberOfSets
    
    /// The format of each game in the match.
    ///
    /// Includes the number of games required to win a set, the type of deuce rule applied,
    /// and whether a player must win by a margin of two games.
    public var gameFormat: GameFormat
    
    /// The format of the tiebreak in the match.
    ///
    /// Includes the number of points required to win a tiebreak, the number of games
    /// at which the tiebreak is triggered, and whether a player must win by a margin of two points.
    /// This value is optional because not all formats use tiebreaks.
    public var tiebreakFormat: TiebreakFormat?
    
    /// Initializes a new `MatchUpFormat` with the specified parameters.
    ///
    /// - Parameters:
    ///   - numberOfSets: The number of sets in the match.
    ///   - gameFormat: The format of each game in the match.
    ///   - tiebreakFormat: The format of the tiebreak in the match.
    public init(numberOfSets: NumberOfSets, gameFormat: GameFormat, tiebreakFormat: TiebreakFormat? = nil) {
        self.numberOfSets = numberOfSets
        self.gameFormat = gameFormat
        self.tiebreakFormat = tiebreakFormat
    }
}
