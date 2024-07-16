//
//  GroundStrokeStyle.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - GroundStrokeStyle Enum

/// Represents the style of a ground stroke shot in tennis.
public enum GroundStrokeStyle: String, Codable, CustomStringConvertible, CaseIterable {
    
    /// A slice ground stroke.
    case slice = "SL"
    
    /// A topspin ground stroke.
    case topspin = "TS"
    
    /// A flat ground stroke.
    case flat = "FL"
    
    /// A lob ground stroke.
    case lob = "LB"
    
    /// A drop shot ground stroke.
    case dropShot = "DS"
    
    /// A passing shot ground stroke.
    case passingShot = "PS"
    
    // MARK: - Properties
    
    /// Provides a human-readable description of the ground stroke style.
    public var description: String {
        return self.rawValue.capitalized
    }
    
    /// Provides a code representation of the ground stroke style for use in the database.
    public var code: String {
        return self.rawValue
    }
}
