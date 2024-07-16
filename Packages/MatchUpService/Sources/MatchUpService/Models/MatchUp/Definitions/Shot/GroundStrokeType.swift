//
//  GroundStrokeType.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - GroundStrokeType Enum

/// Represents the base type of a ground stroke shot in tennis.
public enum GroundStrokeType: String, Codable, CustomStringConvertible, CaseIterable {
    
    /// A forehand ground stroke.
    case forehand = "FH"
    
    /// A backhand ground stroke.
    case backhand = "BH"
    
    // MARK: - Properties
    
    /// Provides a human-readable description of the ground stroke type.
    public var description: String {
        switch self {
        case .forehand:
            return "Forehand"
        case .backhand:
            return "Backhand"
        }
    }
    
    /// Provides a code representation of the ground stroke type for use in the database.
    public var code: String {
        return self.rawValue
    }
}
