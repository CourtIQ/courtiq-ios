//
//  UpdateUserInput.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import GraphQLModels

// MARK: - Domain Model

/// A structure representing the input data required to update user information.
///
/// All fields are optional, allowing selective updates to the user's profile details.
public struct UpdateUserInput {
    
    // MARK: - Properties
    
    /// An optional new username for the user. Pass `nil` to leave unchanged.
    public let username: String?
    
    /// An optional new first name for the user. Pass `nil` to leave unchanged.
    public let firstName: String?
    
    /// An optional new last name for the user. Pass `nil` to leave unchanged.
    public let lastName: String?
    
    /// An optional new gender for the user. Pass `nil` to leave unchanged.
    public let gender: Gender?
    
    /// An optional new date of birth for the user. Pass `nil` to leave unchanged.
    public let dateOfBirth: Date?
    
    /// An optional new biography for the user. Pass `nil` to leave unchanged.
    public let bio: String?
    
    /// An optional new location for the user. Pass `nil` to leave unchanged.
    public let location: Location?

    // MARK: - Initialization
    
    /// Initializes a new `UpdateUserInput`.
    ///
    /// - Parameters:
    ///   - username: An optional new username for the user.
    ///   - firstName: An optional new first name for the user.
    ///   - lastName: An optional new last name for the user.
    ///   - gender: An optional new gender for the user.
    ///   - dateOfBirth: An optional new date of birth for the user.
    ///   - bio: An optional new biography for the user.
    ///   - location: An optional new location for the user.
    public init(
        username: String? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        gender: Gender? = nil,
        dateOfBirth: Date? = nil,
        bio: String? = nil,
        location: Location? = nil
    ) {
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.dateOfBirth = dateOfBirth
        self.bio = bio
        self.location = location
    }
}

// MARK: - GraphQL Mapping

public extension API.UpdateUserInput {
    /// Initializes a GraphQL `UpdateUserInput` from a domain `UpdateUserInput`.
    ///
    /// Converts the domain model's optional fields into the GraphQL `Input` types, using `.null` where values are not provided.
    ///
    /// - Parameter domainInput: The domain `UpdateUserInput` object.
    init(domainInput: UpdateUserInput) {
        self.init(
            username: domainInput.username.map { .some($0) } ?? .null,
            firstName: domainInput.firstName.map { .some($0) } ?? .null,
            lastName: domainInput.lastName.map { .some($0) } ?? .null,
            gender: domainInput.gender.map { .some(GraphQLEnum($0.toGraphQL())) } ?? .null,
            dateOfBirth: .from(domainInput.dateOfBirth),
            bio: domainInput.bio.map { .some($0) } ?? .null,
            location: domainInput.location.map { .some(API.LocationInput(domainLocation: $0)) } ?? .null
        )
    }
}

// MARK: - LocationInput Mapper (If Needed)

public extension API.LocationInput {
    /// Initializes a GraphQL `LocationInput` from a domain `Location`.
    ///
    /// - Parameter domainLocation: The domain `Location` object.
    init(domainLocation: Location) {
        self.init(
            city: domainLocation.city.map { .some($0) } ?? .null,
            state: domainLocation.state.map { .some($0) } ?? .null,
            country: domainLocation.country.map { .some($0) } ?? .null,
            latitude: domainLocation.latitude.map { .some($0) } ?? .null,
            longitude: domainLocation.longitude.map { .some($0) } ?? .null
        )
    }
}
