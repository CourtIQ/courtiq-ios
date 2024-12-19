//
//  UserServiceProtocol.swift
//
//
//  Created by Pranav Suri on 2024-07-04.
//

import Foundation
import Models

/// A protocol defining the required methods for a user service that interacts with a GraphQL backend.
public protocol UserServiceProtocol: AnyObject, ObservableObject {
    /// The currently logged-in user, if any. This is a GraphQL-generated type from your `MeQuery` for example.
    var currentUser: User? { get }
    
    /// Fetches and updates the current user information from the server.
    /// - Throws: An error if the user could not be fetched.
    @MainActor
    func fetchCurrentUser() async throws
    
    /// Updates the current user profile with additional info.
    /// - Parameter additionalInfo: A dictionary or a structured type containing additional user info.
    /// - Throws: An error if the update fails.
    @MainActor
    func updateUser(_ additionalInfo: API.UpdateUserInput) async throws
    
    /// Checks if a username is available.
    /// - Parameter username: The username to check.
    /// - Returns: A Boolean value indicating whether the username is available.
    @MainActor
    func isUsernameAvailable(_ username: String) async throws -> Bool
    
    func completeRegistration(_ registrationInfo: CompleteRegistrationUser) async throws
}
