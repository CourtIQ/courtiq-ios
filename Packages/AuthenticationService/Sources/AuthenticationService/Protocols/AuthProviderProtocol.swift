//
//  AuthProviderProtocol.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import FirebaseAuth

// MARK: - AuthProviderProtocol
@available(iOS 13.0.0, *)
public protocol AuthProviderProtocol: AnyObject {
    
    // MARK: - Properties
    
    /// A Boolean value indicating whether a user is logged in.
    var isUserLoggedIn: Bool { get }
    
    // MARK: - Authentication Methods
    
    /// Signs up a user with the provided email and password.
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password of the user.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign up fails.
    func signUp(email: String, password: String) async throws
    
    /// Signs in a user with the provided email and password.
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password of the user.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign in fails.
    func signIn(email: String, password: String) async throws
    
    /// Signs in a user with Google authentication.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign in with Google fails.
    func signInWithGoogle() async throws
    
    /// Signs out the currently authenticated user.
    /// - Throws: An error if sign out fails.
    func signOut() async throws
    
    /// Deletes the currently authenticated user's account.
    /// - Throws: An error if account deletion fails.
    func deleteAccount() async throws
    
    /// Retrieves an ID token for the currently authenticated user.
    ///
    /// - Returns: A `String` representing the user's ID token.
    /// - Throws: An error if the token cannot be retrieved.
    func getIDToken() async throws -> String
}
