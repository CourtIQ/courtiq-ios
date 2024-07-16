//
//  Player.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - Player Struct

/// Represents a player in a tennis match.
///
/// This struct includes the basic information of a player such as their unique identifier,
/// first name, and last name.
public struct Player: Codable, Equatable {
    
    // MARK: - Properties
    
    /// The unique identifier of the player.
    ///
    /// This is used to distinguish between different players.
    public var playerId: String
    
    /// The first name of the player.
    ///
    /// This is the given name of the player.
    public var firstName: String
    
    /// The last name of the player.
    ///
    /// This is the family name of the player.
    public var lastName: String?
    
    // MARK: - Initializer
    
    /// Initializes a new `Player` with the specified parameters.
    ///
    /// - Parameters:
    ///   - playerId: The unique identifier of the player.
    ///   - firstName: The first name of the player.
    ///   - lastName: The last name of the player (optional).
    public init(playerId: String, firstName: String, lastName: String? = nil) {
        self.playerId = playerId
        self.firstName = firstName
        self.lastName = lastName
    }
}
