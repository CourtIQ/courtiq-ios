//
//  RelationshipType.swift
//
//
//  Created by Pranav Suri on 2024-08-05.
//

import Foundation

// MARK: - RelationshipType Enum

/// Represents the type of a relationship request.
///
/// The type can either be a friend request or a coach request.
public enum RelationshipType: String, Codable, CustomStringConvertible, CaseIterable {
    
    /// A friend request.
    case friend = "F"
    
    /// A coach request.
    case coach = "C"
    
    // MARK: - Description
    
    /// Provides a human-readable description of the request type.
    ///
    /// - Returns: A string describing the request type.
    public var description: String {
        switch self {
        case .friend:
            return "Friend Request"
        case .coach:
            return "Coach Request"
        }
    }
    
    // MARK: - Code
    
    /// Provides the code representation of the request type.
    ///
    /// - Returns: A string representing the request type code.
    public var code: String {
        return self.rawValue
    }
}
