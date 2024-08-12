//
//  TiebreakFormat.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - TiebreakFormat Struct

/// Represents the format of a tiebreak in a tennis match.
///
/// The format includes the number of points required to win a tiebreak, the number of games
/// at which the tiebreak is triggered, and whether a player must win by a margin of two points.
public struct TiebreakFormat: Codable {
    
    // MARK: - Properties
    
    /// The number of points required to win a tiebreak.
    ///
    /// This determines how many points a player needs to win in order to win the tiebreak.
    public var tiebreakPoints: TiebreakPoints
    
    /// Indicates whether a player must win by a margin of two points.
    ///
    /// This rule applies to ensure that a player must win by at least two points to secure the tiebreak.
    public var mustWinByTwo: Bool
    
    // MARK: - Initializer
    
    /// Initializes a new `TiebreakFormat` with the specified parameters.
    ///
    /// - Parameters:
    ///   - tiebreakPoints: The number of points required to win a tiebreak.
    ///   - mustWinByTwo: Indicates whether a player must win by a margin of two points.
    public init(tiebreakPoints: TiebreakPoints = .seven, mustWinByTwo: Bool = true) {
        self.tiebreakPoints = tiebreakPoints
        self.mustWinByTwo = mustWinByTwo
    }
}
