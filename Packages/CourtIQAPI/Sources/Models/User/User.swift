//
//  User.swift
//  CourtIQAPI
//
//  Created by Pranav Suri on 2024-12-19.
//

import Foundation
import GraphQLModels

// MARK: - User

/// Represents a user with their basic information, profile details, and associated equipment.
public struct User: Identifiable, Sendable {
    
    // MARK: - Properties
    
    /// The unique identifier of the user.
    public let id: String
    
    /// The Firebase unique identifier for the user.
    public let firebaseId: String
    
    /// The user's email address.
    public let email: String?
    
    /// The user's first name.
    public let firstName: String?
    
    /// The user's last name.
    public let lastName: String?
    
    /// The user's display name, typically shown in the app.
    public let displayName: String?
    
    /// The user's username for unique identification within the platform.
    public let username: String?
    
    /// The user's gender.
    public let gender: Gender?
    
    /// The URL of the user's profile picture.
    public let profilePicture: String?
    
    /// The user's date of birth.
    public let dateOfBirth: Date?
    
    /// A short biography or description provided by the user.
    public let bio: String?
    
    /// The user's location details.
    public let location: Location?
    
    /// The user's rating or skill level (e.g., tennis rating).
    public let rating: Int?
    
    /// The timestamp when the user was created.
    public let createdAt: Date
    
    /// The timestamp when the user's information was last updated.
    public let lastUpdated: Date?
    
    // MARK: - Initialization
    
    /// Initializes a new `User` object.
    public init(
        id: String,
        firebaseId: String,
        email: String? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        displayName: String? = nil,
        username: String? = nil,
        gender: Gender? = nil,
        profilePicture: String? = nil,
        dateOfBirth: Date? = nil,
        bio: String? = nil,
        location: Location? = nil,
        rating: Int? = nil,
        createdAt: Date,
        lastUpdated: Date? = nil
    ) {
        self.id = id
        self.firebaseId = firebaseId
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.displayName = displayName
        self.username = username
        self.gender = gender
        self.profilePicture = profilePicture
        self.dateOfBirth = dateOfBirth
        self.bio = bio
        self.location = location
        self.rating = rating
        self.createdAt = createdAt
        self.lastUpdated = lastUpdated
    }
}

// MARK: - Mappers

public extension User {
    /// Maps a GraphQL `UserFields` object to the domain `User` model.
    init(graphql: API.UserFields) {
        self.init(
            id: graphql.id,
            firebaseId: graphql.firebaseId,
            email: graphql.email,
            firstName: graphql.firstName,
            lastName: graphql.lastName,
            displayName: graphql.displayName,
            username: graphql.username,
            gender: graphql.gender.flatMap { $0.value }.map { Gender(graphqlType: $0) },
            profilePicture: graphql.profilePicture,
            dateOfBirth: graphql.dateOfBirth?.dateValue,
            bio: graphql.bio,
            location: graphql.location.map { Location(graphql: $0) },
            rating: graphql.rating,
            createdAt: graphql.createdAt?.dateValue ?? Date(),
            lastUpdated: graphql.lastUpdated?.dateValue
        )
    }
}

