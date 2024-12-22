//
//  RelationshipType.swift
//  SocialService
//
//  Created by Pranav on 2024-12-22.
//

import Foundation
import GraphQLModels

// MARK: - RelationshipType

/// An enumeration representing the different types of relationships that can exist between users.
public enum RelationshipType: String, Sendable {
    
    /// A friendship relationship between two users.
    case friendship = "FRIENDSHIP"
    
    /// A coaching relationship between a coach and a coachee.
    case coachship = "COACHSHIP"
    
    // MARK: - Display Name

    /// Returns the localized display name for the relationship type.
    public var displayName: String {
        switch self {
        case .friendship:
            return NSLocalizedString("Friendship", comment: "RelationshipType - Friendship")
        case .coachship:
            return NSLocalizedString("Coachship", comment: "RelationshipType - Coachship")
        }
    }
    
    // MARK: - Mappers
    
    /// Initializes a `RelationshipType` from the GraphQL `API.RelationshipType` enum.
    ///
    /// - Parameter graphqlType: The GraphQL `API.RelationshipType` value.
    public init(graphqlType: API.RelationshipType) {
        switch graphqlType {
        case .friendship:
            self = .friendship
        case .coachship:
            self = .coachship
        }
    }
    
    /// Converts this `RelationshipType` value to its corresponding GraphQL `API.RelationshipType` enum.
    ///
    /// - Returns: The GraphQL `API.RelationshipType` value.
    public func toGraphQL() -> API.RelationshipType {
        switch self {
        case .friendship:
            return .friendship
        case .coachship:
            return .coachship
        }
    }
}
