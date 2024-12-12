//
//  AuthProviderProtocol.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import FirebaseAuth

// MARK: - AuthProviderProtocol

/// A protocol defining the required properties and methods for an authentication provider.
@available(iOS 13.0.0, *)
public protocol AuthProviderProtocol: AnyObject {
    
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
    
    /// Updates the authenticated user's profile information.
    /// - Parameters:
    ///   - displayName: The display name of the user (optional).
    ///   - photoURL: The URL of the user's profile picture as a string (optional).
    /// - Throws: An error if the update fails.
    func updateUserProfile(displayName: String?, photoURL: String?) async throws
    
    /// Retrieves an ID token for the currently authenticated user.
    ///
    /// This method provides an ID token that can be used to authenticate requests to back-end services,
    /// integrate with other authentication systems, or verify the user's identity on your server.
    /// - Returns: A `String` representing the user's ID token.
    /// - Throws: An error if the token cannot be retrieved (for example, if the user is not signed in or the request fails).
    func getIDToken() async throws -> String
    
    // TODO: Remove
    func getCustomClaims() async throws -> [String: Any]
}
