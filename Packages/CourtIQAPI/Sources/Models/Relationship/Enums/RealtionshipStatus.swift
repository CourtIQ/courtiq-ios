//
//  RelationshipStatus.swift
//  SocialService
//
//  Created by Pranav on 2024-12-22.
//

import Foundation
import GraphQLModels

// MARK: - RelationshipStatus

/// An enumeration representing the different statuses of a user relationship.
public enum RelationshipStatus: String, Sendable {
    
    /// The relationship is in a pending state, meaning a request has been sent but not yet accepted.
    case pending = "PENDING"
    
    /// The relationship is active, meaning the request has been accepted and the relationship is established.
    case active = "ACTIVE"
    
    /// Indicates that there is currently no active or pending relationship.
    case none = "NONE"
    
    // MARK: - Display Name

    /// Returns the localized display name for the relationship status.
    public var displayName: String {
        switch self {
        case .pending:
            return NSLocalizedString("Pending", comment: "RelationshipStatus - Pending")
        case .active:
            return NSLocalizedString("Active", comment: "RelationshipStatus - Active")
        case .none:
            return NSLocalizedString("None", comment: "RelationshipStatus - None")
        }
    }
    
    // MARK: - Mappers
    
    /// Initializes a `RelationshipStatus` value from the GraphQL `API.RelationshipStatus` enum.
    ///
    /// - Parameter graphqlType: The GraphQL `API.RelationshipStatus` value.
    public init(graphqlType: API.RelationshipStatus) {
        switch graphqlType {
        case .pending:
            self = .pending
        case .active:
            self = .active
        case .none:
            self = .none
        }
    }
    
    /// Converts this `RelationshipStatus` value to its corresponding GraphQL `API.RelationshipStatus` enum.
    ///
    /// - Returns: The GraphQL `API.RelationshipStatus` value.
    public func toGraphQL() -> API.RelationshipStatus {
        switch self {
        case .pending:
            return .pending
        case .active:
            return .active
        case .none:
            return .none
        }
    }
}
