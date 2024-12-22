//
//  Friendship.swift
//  SocialService
//
//  Created by Pranav on 2024-12-22.
//

import Foundation
import GraphQLModels

// MARK: - Friendship

/// A domain model representing a relationship between two or more users.
public struct Friendship: Equatable, Sendable {
    
    // MARK: - Properties
    
    /// A unique identifier for this friendship.
    public let id: String
    
    /// The identifiers of the users participating in this relationship.
    public let participants: [String]
    
    /// The type of relationship (e.g. friendship, coachship).
    public let type: RelationshipType
    
    /// The status of the relationship (e.g. pending, active, none).
    public let status: RelationshipStatus
    
    /// The timestamp indicating when this relationship was created.
    public let createdAt: Date
    
    /// The timestamp indicating when this relationship was last updated.
    public let updatedAt: Date
    
    /// The user ID that initiated the request or created the relationship, if applicable.
    public let senderId: String
    
    /// The user ID that received the request, if applicable.
    public let receiverId: String
    
    // MARK: - Initialization
    
    /// Initializes a new `FriendshipModel` instance.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the friendship.
    ///   - participants: The user IDs participating in this relationship.
    ///   - type: The type of the relationship (friendship, coachship, etc.).
    ///   - status: The current status of the relationship.
    ///   - createdAt: The date/time this relationship was created.
    ///   - updatedAt: The date/time this relationship was last updated.
    ///   - senderId: The user ID that initiated the request.
    ///   - receiverId: The user ID that received the request.
    public init(
        id: String,
        participants: [String],
        type: RelationshipType,
        status: RelationshipStatus,
        createdAt: Date,
        updatedAt: Date,
        senderId: String,
        receiverId: String
    ) {
        self.id = id
        self.participants = participants
        self.type = type
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.senderId = senderId
        self.receiverId = receiverId
    }
}

// MARK: - Mappers

public extension Friendship {
    /// Initializes a `Friendship` from a GraphQL `FriendshipFields` object.
    ///
    /// - Parameter graphql: The GraphQL `FriendshipFields` object to be converted.
    init(graphql: API.FriendshipFields) {
        self.init(
            id: graphql.id,
            participants: graphql.participants.map { $0 },
            type: RelationshipType(graphqlType: graphql.type.value ?? .friendship),
            status: RelationshipStatus(graphqlType: graphql.status.value ?? .none),
            createdAt: graphql.createdAt.dateValue,
            updatedAt: graphql.updatedAt.dateValue,
            senderId: graphql.senderId,
            receiverId: graphql.receiverId
        )
    }
    
    /// Converts this `FriendshipModel` into a GraphQL-friendly format.
    ///
    /// This shows an example of how you might convert your model's properties
    /// back into GraphQL-compatible values (if needed).
    /// Adjust as required by your application's mutation needs.
    func toGraphQL() -> (
        id: String,
        participants: [String],
        type: API.RelationshipType,
        status: API.RelationshipStatus,
        createdAt: Date,
        updatedAt: Date,
        senderId: String,
        receiverId: String
    ) {
        return (
            id: self.id,
            participants: self.participants,
            type: self.type.toGraphQL(),
            status: self.status.toGraphQL(),
            createdAt: self.createdAt,
            updatedAt: self.updatedAt,
            senderId: self.senderId,
            receiverId: self.receiverId
        )
    }
}
