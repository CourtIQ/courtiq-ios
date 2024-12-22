//
//  Location.swift
//  CourtIQAPI
//
//  Created by Pranav Suri on 2024-12-19.
//

import Foundation
import GraphQLModels

// MARK: - Location

/// Represents the user's location, including city, state, country, and geographic coordinates.
public struct Location: Sendable {
    
    // MARK: - Properties
    
    /// The name of the city where the user is located.
    public let city: String?
    
    /// The name of the state or province where the user is located.
    public let state: String?
    
    /// The name of the country where the user is located.
    public let country: String?
    
    /// The latitude coordinate of the user's location.
    public let latitude: Double?
    
    /// The longitude coordinate of the user's location.
    public let longitude: Double?
    
    // MARK: - Initialization
    
    /// Initializes a new `Location` object.
    ///
    /// - Parameters:
    ///   - city: The city where the user is located.
    ///   - state: The state or province where the user is located.
    ///   - country: The country where the user is located.
    ///   - latitude: The latitude coordinate of the location.
    ///   - longitude: The longitude coordinate of the location.
    public init(city: String? = nil, state: String? = nil, country: String? = nil, latitude: Double? = nil, longitude: Double? = nil) {
        self.city = city
        self.state = state
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
    }
}

// MARK: - Location Mapper

public extension Location {
    /// Maps a GraphQL `Location` object to the domain `Location` model.
    init(graphql: API.UserFields.Location) {
        self.init(
            city: graphql.city,
            state: graphql.state,
            country: graphql.country,
            latitude: graphql.latitude,
            longitude: graphql.longitude
        )
    }
}
