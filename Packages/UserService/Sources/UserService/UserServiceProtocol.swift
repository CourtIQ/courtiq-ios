//
//  UserServiceProtocol.swift
//
//
//  Created by Pranav Suri on 2024-07-04.
//

import Foundation
import Models
import GraphQLModels
import CourtIQAPI

/// A protocol defining the required methods for a user service that interacts with a GraphQL backend.
public protocol UserServiceProtocol {
    /// Fetches and updates the current user information from the server.
    /// - Throws: An error if the user could not be fetched.
    func fetchCurrentUser() async throws
    
    /// Updates the current user profile with additional info.
    /// - Parameter additionalInfo: A dictionary or a structured type containing additional user info.
    /// - Throws: An error if the update fails.
    func updateUser(_ additionalInfo: UpdateUserInput) async throws
    
    /// Checks if a username is available.
    /// - Parameter username: The username to check.
    /// - Returns: A Boolean value indicating whether the username is available.
    func isUsernameAvailable(_ username: String) async throws -> Bool
    
    func completeRegistration(_ registrationInfo: UpdateUserInput) async throws
}
