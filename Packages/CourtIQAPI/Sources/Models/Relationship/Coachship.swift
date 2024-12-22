//
//  Coachship.swift
//  SocialService
//
//  Created by [Your Name] on [Date].
//

import Foundation
import GraphQLModels

// MARK: - Coachship

/// A domain model representing a coaching relationship between a coach and a student.
public struct Coachship: Equatable, Sendable {
    
    // MARK: - Properties
    
    /// A unique identifier for this coachship.
    public let id: String
    
    /// The identifiers of the users participating in this relationship (typically includes coach and student).
    public let participants: [String]
    
    /// The type of relationship (e.g., friendship, coachship).
    public let type: RelationshipType
    
    /// The status of the relationship (e.g., pending, active, none).
    public let status: RelationshipStatus
    
    /// The timestamp indicating when this coachship was created.
    public let createdAt: Date
    
    /// The timestamp indicating when this coachship was last updated.
    public let updatedAt: Date
    
    /// The user ID representing the coach in this relationship.
    public let coachId: String
    
    /// The user ID representing the student in this relationship.
    public let studentId: String
    
    // MARK: - Initialization
    
    /// Initializes a new `Coachship` instance.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the coachship.
    ///   - participants: The user IDs participating in this coachship.
    ///   - type: The type of the relationship (usually `.coachship`).
    ///   - status: The current status of the relationship.
    ///   - createdAt: The date/time this coachship was created.
    ///   - updatedAt: The date/time this coachship was last updated.
    ///   - coachId: The user ID representing the coach.
    ///   - studentId: The user ID representing the student.
    public init(
        id: String,
        participants: [String],
        type: RelationshipType,
        status: RelationshipStatus,
        createdAt: Date,
        updatedAt: Date,
        coachId: String,
        studentId: String
    ) {
        self.id = id
        self.participants = participants
        self.type = type
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.coachId = coachId
        self.studentId = studentId
    }
}

// MARK: - Mappers

public extension Coachship {
    /// Initializes a `Coachship` from a GraphQL `CoachshipFields` object.
    ///
    /// - Parameter graphql: The GraphQL `CoachshipFields` object to be converted.
    init(graphql: API.CoachshipFields) {
        self.init(
            id: graphql.id,
            participants: graphql.participants.map { $0 },
            type: RelationshipType(graphqlType: graphql.type.value ?? .coachship),
            status: RelationshipStatus(graphqlType: graphql.status.value ?? .none),
            createdAt: graphql.createdAt.dateValue,
            updatedAt: graphql.updatedAt.dateValue,
            coachId: graphql.coachId,
            studentId: graphql.studentId
        )
    }
    
    /// Converts this `Coachship` instance into a GraphQL-friendly format.
    ///
    /// Adjust this as required by your application's mutation or query needs.
    func toGraphQL() -> (
        id: String,
        participants: [String],
        type: API.RelationshipType,
        status: API.RelationshipStatus,
        createdAt: Date,
        updatedAt: Date,
        coachId: String,
        studentId: String
    ) {
        return (
            id: self.id,
            participants: self.participants,
            type: self.type.toGraphQL(),
            status: self.status.toGraphQL(),
            createdAt: self.createdAt,
            updatedAt: self.updatedAt,
            coachId: self.coachId,
            studentId: self.studentId
        )
    }
}
