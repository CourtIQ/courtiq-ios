//
//  ShotType.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - ShotType Enum

/// Represents different types of tennis shots.
public enum ShotType: String, Codable {
    case forehand = "FH"
    case backhand = "BH"
    case serve = "SE"

    // MARK: - Description

    /// Provides a human-readable description of the shot type.
    ///
    /// - Returns: A string describing the shot type.
    public var description: String {
        switch self {
        case .forehand:
            return "Forehand"
        case .backhand:
            return "Backhand"
        case .serve:
            return "Serve"
        }
    }

    // MARK: - Code

    /// Provides the code representation of the shot type.
    ///
    /// - Returns: A string representing the shot type code.
    public var code: String {
        return self.rawValue
    }
}
