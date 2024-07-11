//
//  TiebreakFormat.swift
//  
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

/// Represents the format of a tiebreak in a tennis match.
///
/// The format includes the number of points required to win a tiebreak, the number of games
/// at which the tiebreak is triggered, and whether a player must win by a margin of two points.
public struct TiebreakFormat: Codable {
    
    /// The number of points required to win a tiebreak.
    ///
    /// This determines how many points a player needs to win in order to win the tiebreak.
    public var tiebreakPoints: TiebreakPoints
    
    /// The number of games required before a tiebreak is played.
    ///
    /// This determines when a tiebreak is triggered in a set. For example, a tiebreak
    /// might be triggered at 6 games all.
    public var tiebreakAt: Int
    
    /// Indicates whether a player must win by a margin of two points.
    ///
    /// This rule applies to ensure that a player must win by at least two points to secure the tiebreak.
    public var mustWinByTwo: Bool
    
    /// Initializes a new `TiebreakFormat` with the specified parameters.
    ///
    /// - Parameters:
    ///   - tiebreakPoints: The number of points required to win a tiebreak.
    ///   - tiebreakAt: The number of games required before a tiebreak is played.
    ///   - mustWinByTwo: Indicates whether a player must win by a margin of two points.
    public init(tiebreakPoints: TiebreakPoints, tiebreakAt: Int, mustWinByTwo: Bool) {
        self.tiebreakPoints = tiebreakPoints
        self.tiebreakAt = tiebreakAt
        self.mustWinByTwo = mustWinByTwo
    }
}
