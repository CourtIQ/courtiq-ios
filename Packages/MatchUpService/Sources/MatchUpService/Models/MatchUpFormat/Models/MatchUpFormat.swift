//
//  MatchUpFormat.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - MatchUpFormat Struct

/// Represents the overall format of a tennis match.
///
/// The format includes the number of sets in the match, the format for each set,
/// and an optional format for the final set.
public struct MatchUpFormat: Codable {
    
    // MARK: - Properties
    
    /// The number of sets in the match.
    ///
    /// Determines how many sets a player needs to win to win the match.
    public var numberOfSets: NumberOfSets
    
    /// The format of each set in the match.
    ///
    /// Includes the number of games required to win a set, the type of deuce rule applied,
    /// and whether a player must win by a margin of two games.
    public var setFormat: SetFormat
    
    /// The format of the final set in the match.
    ///
    /// Includes the number of games required to win the final set, the type of deuce rule applied,
    /// and whether a player must win by a margin of two games.
    /// This value is optional because not all match formats have a special final set format.
    public var finalSetFormat: SetFormat?
    
    // MARK: - Initializer
    
    /// Initializes a new `MatchUpFormat` with the specified parameters.
    ///
    /// - Parameters:
    ///   - numberOfSets: The number of sets in the match.
    ///   - setFormat: The format of each set in the match.
    ///   - finalSetFormat: The format of the final set in the match.
    public init(numberOfSets: NumberOfSets, setFormat: SetFormat, finalSetFormat: SetFormat? = nil) {
        self.numberOfSets = numberOfSets
        self.setFormat = setFormat
        self.finalSetFormat = finalSetFormat
    }
}
