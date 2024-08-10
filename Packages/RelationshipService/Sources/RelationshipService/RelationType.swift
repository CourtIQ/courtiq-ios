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
/// The type can either be a friend or a coach.
@available(iOS 14.0, *)
public enum RelationType: String, Codable, CustomStringConvertible, CaseIterable {
    
    /// A friend relationship.
    case friend = "F"
    
    /// A coach relationship.
    case coach = "C"
    
    /// A group relationship.
    case group = "G"
    
    // MARK: - Description
    
    /// Provides a human-readable description of the request type.
    ///
    /// - Returns: A string describing the request type.
    public var description: String {
        switch self {
        case .friend:
            return "Friend"
        case .coach:
            return "Coach"
        case .group:
            return "Group"
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
