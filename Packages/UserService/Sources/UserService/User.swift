//
//  User.swift
//  UserService
//
//  Created by Pranav Suri on 2024-12-15.
//

import Foundation
import Models

public struct User: Identifiable, Codable {
    public let id: String
    public let firebaseId: String
    public let email: String
    public var firstName: String
    public var lastName: String
    public var displayName: String
    public var username: String
    public var profilePicture: String?
    public var dateOfBirth: Date?
    public var bio: String?
    public var location: Location?
    public var rating: Double
    public let createdAt: Date
    public let lastUpdated: Date
    
    // Add public initializer
    public init(
        id: String,
        firebaseId: String,
        email: String,
        firstName: String,
        lastName: String,
        displayName: String,
        username: String,
        profilePicture: String?,
        dateOfBirth: Date?,
        bio: String?,
        location: Location?,
        rating: Double,
        createdAt: Date,
        lastUpdated: Date
    ) {
        self.id = id
        self.firebaseId = firebaseId
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.displayName = displayName
        self.username = username
        self.profilePicture = profilePicture
        self.dateOfBirth = dateOfBirth
        self.bio = bio
        self.location = location
        self.rating = rating
        self.createdAt = createdAt
        self.lastUpdated = lastUpdated
    }
    
    public struct Location: Codable {
        public var city: String?
        public var state: String?
        public var country: String?
        public var latitude: Double?
        public var longitude: Double?
        
        public init(
            city: String? = nil,
            state: String? = nil,
            country: String? = nil,
            latitude: Double? = nil,
            longitude: Double? = nil
        ) {
            self.city = city
            self.state = state
            self.country = country
            self.latitude = latitude
            self.longitude = longitude
        }
    }
}

extension User {
    public init(from graphQLUser: API.UserFields) {
        self.id = String(graphQLUser.id)  // Convert ObjectID to String
        self.firebaseId = graphQLUser.firebaseId
        self.email = graphQLUser.email
        self.firstName = graphQLUser.firstName ?? ""
        self.lastName = graphQLUser.lastName ?? ""
        self.displayName = graphQLUser.displayName ?? ""
        self.username = graphQLUser.username ?? ""
        self.profilePicture = graphQLUser.profilePicture
        self.rating = Double(graphQLUser.rating ?? 0)  // Convert Int? to Double
        
        // Date conversions
        let formatter = ISO8601DateFormatter()
        self.dateOfBirth = graphQLUser.dateOfBirth.flatMap {
            String($0)  // Convert API.Time to String first
        }.flatMap {
            formatter.date(from: $0)
        }
        
        self.createdAt = graphQLUser.createdAt.flatMap {
            formatter.date(from: String($0))
        } ?? Date()
        
        self.lastUpdated = graphQLUser.lastUpdated.flatMap {
            formatter.date(from: String($0))
        } ?? Date()
        
        self.bio = graphQLUser.bio
        
        // Location
        if let graphQLLocation = graphQLUser.location {
            self.location = Location(
                city: graphQLLocation.city,
                state: graphQLLocation.state,
                country: graphQLLocation.country,
                latitude: graphQLLocation.latitude,
                longitude: graphQLLocation.longitude
            )
        } else {
            self.location = nil
        }
    }
}
