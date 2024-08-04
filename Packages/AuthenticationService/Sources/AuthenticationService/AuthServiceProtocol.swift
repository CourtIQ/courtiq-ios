//
//  AuthServiceProtocol.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import SwiftUI

// MARK: - AuthServiceProtocol

/// A protocol defining the required properties and methods for an authentication service.
@available(iOS 14.0, *)
@MainActor
public protocol AuthServiceProtocol: ObservableObject {
    
    // MARK: - Properties
    
    /// The currently authenticated user, if any.
    var currentUser: AuthUser? { get }
    
    /// A Boolean value indicating whether a user is logged in.
    var isUserLoggedIn: Bool { get }
    
    // MARK: - Authentication Methods
    
    /// Signs up a user with the provided email and password.
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password of the user.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign up fails.
    func signUp(email: String, password: String) async throws -> AuthUser
    
    /// Signs in a user with the provided email and password.
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password of the user.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign in fails.
    func signIn(email: String, password: String) async throws -> AuthUser
    
    /// Signs in a user with Google authentication.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign in with Google fails.
    func signInWithGoogle() async throws -> AuthUser
    
    /// Signs out the currently authenticated user.
    /// - Throws: An error if sign out fails.
    func signOut() async throws
    
    /// Deletes the currently authenticated user's account.
    /// - Throws: An error if account deletion fails.
    func deleteAccount() async throws
    
    // MARK: - State Management
    
    /// Toggles the logged-in state of the user.
    func toggleLoggedInState()
}
