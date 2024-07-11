//
//  MatchUpType.swift
//  
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - MatchUpType Enum

/// Represents the type of a tennis match.
///
/// The type can either be singles or doubles.
public enum MatchUpType: String, Codable {
    
    /// A doubles match.
    case doubles = "D"
    
    /// A singles match.
    case singles = "S"
    
    // MARK: - Description
    
    /// Provides a human-readable description of the match type.
    ///
    /// - Returns: A string describing the match type.
    public var description: String {
        switch self {
        case .doubles:
            return "Doubles"
        case .singles:
            return "Singles"
        }
    }
    
    // MARK: - Code
    
    /// Provides the code representation of the match type.
    ///
    /// - Returns: A string representing the match type code.
    public var code: String {
        return self.rawValue
    }
}
