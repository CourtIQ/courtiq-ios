//
//  ShotType.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - ShotType Enum

/// Represents the base type of a shot in tennis.
public enum ShotType: String, Codable, CustomStringConvertible, CaseIterable {
    
    /// A serve shot.
    case serve = "SE"
    
    /// A ground stroke shot.
    case groundStroke = "GS"
    
    /// A volley shot.
    case volley = "VO"
    
    // MARK: - Properties
    
    /// Provides a human-readable description of the shot type.
    public var description: String {
        switch self {
        case .serve:
            return "Serve"
        case .groundStroke:
            return "Ground Stroke"
        case .volley:
            return "Volley"
        }
    }
    
    /// Provides a code representation of the shot type for use in the database.
    public var code: String {
        return self.rawValue
    }
}
