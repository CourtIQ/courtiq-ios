//
//  UserRepositoryProtocol.swift
//  UserService
//
//  Created by Pranav Suri on 2024-12-20.
//

import Foundation
import Models

/// A protocol defining user-related data operations.
public protocol UserRepositoryProtocol: Sendable {
    
    // MARK: - Methods
    
    /// Fetches the currently authenticated user's information.
    ///
    /// - Returns: The currently authenticated `User` if available, otherwise `nil`.
    /// - Throws: An error if the fetch operation fails.
    func fetchCurrentUser() async throws -> User?
    
    /// Fetches a user by their unique identifier.
    ///
    /// - Parameter id: The unique identifier of the user to fetch.
    /// - Returns: A `User` object if a user with the given ID exists, otherwise `nil`.
    /// - Throws: An error if the fetch operation fails.
    func fetchUser(by id: String) async throws -> User?
    
    /// Updates the information of a given user.
    ///
    /// - Parameter user: The `User` object containing updated information.
    /// - Returns: The updated `User` object after a successful update operation.
    /// - Throws: An error if the update operation fails.
    func updateUser(_ user: User) async throws -> User
    
    /// Completes the registration for the current user by updating necessary fields.
    ///
    /// - Parameter registrationInfo: An input object containing updated user information
    ///   required for completing the registration process.
    /// - Returns: The updated `User` object after the registration is completed.
    /// - Throws: An error if the registration process fails.
    func completeUserRegistration(_ registrationInfo: UpdateUserInput) async throws -> User
}
