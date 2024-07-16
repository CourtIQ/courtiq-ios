//
//  DeuceType.swift
//
//
//  Created by Pranav Suri on 2024-07-10.
//

import Foundation

// MARK: - DeuceType Enum

/// Represents the type of deuce used in a tennis match.
///
/// A deuce occurs when both players have the same score, typically at 40-40.
/// This enum defines the rules for resolving a deuce, which can vary depending on the match format.
public enum DeuceType: String, CustomStringConvertible, Codable, CaseIterable {
    
    /// Sudden Death (SD) deuce type.
    ///
    /// In this format, the next point wins the game.
    /// This is often used to speed up matches by avoiding prolonged deuces.
    case suddenDeath = "SD"
    
    /// Normal Deuce (ND) type.
    ///
    /// In this traditional format, a player must win two consecutive points after reaching deuce to win the game.
    case normalDeuce = "ND"
    
    /// One Deuce (OD) type.
    ///
    /// In this format, after the first deuce (40-40), if the score reaches deuce again after one player gains advantage,
    /// the next point decides the game. This helps in speeding up the game while allowing for some degree of traditional deuce play.
    case oneDeuce = "OD"
    
    /// A textual description of the deuce type.
    ///
    /// This provides a human-readable description of the enum value.
    public var description: String {
        switch self {
        case .suddenDeath:
            return "Sudden Death"
        case .normalDeuce:
            return "Normal Deuce"
        case .oneDeuce:
            return "One Deuce"
        }
    }
}
