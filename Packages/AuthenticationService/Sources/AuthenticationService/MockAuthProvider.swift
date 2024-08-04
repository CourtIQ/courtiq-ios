//
//  File.swift
//
//
//  Created by Pranav Suri on 2024-08-03.
//

import Foundation

// MARK: - MockAuthProvider

/// A mock authentication provider for testing purposes.
@available(iOS 13.0.0, *)
final class MockAuthProvider: AuthProviderProtocol {
    
    // MARK: - Properties
    
    var currentUser: (any AuthUser)? = MockUser(uid: UUID().uuidString)
    var isUserLoggedIn: Bool = false
    
    // MARK: - Authentication Methods
    
    /// Signs up a user with the provided email and password.
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password of the user.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign up fails.
    func signUp(email: String, password: String) async throws -> AuthUser {
        let mockUser = MockUser(uid: UUID().uuidString)
        self.currentUser = mockUser
        self.isUserLoggedIn = true
        return mockUser
    }
    
    /// Signs in a user with the provided email and password.
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password of the user.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign in fails.
    func signIn(email: String, password: String) async throws -> AuthUser {
        let mockUser = MockUser(uid: UUID().uuidString)
        self.currentUser = mockUser
        self.isUserLoggedIn = true
        return mockUser
    }
    
    /// Signs in a user with Google authentication.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign in with Google fails.
    func signInWithGoogle() async throws -> AuthUser {
        let mockUser = MockUser(uid: UUID().uuidString)
        self.currentUser = mockUser
        self.isUserLoggedIn = true
        return mockUser
    }
    
    /// Signs out the currently authenticated user.
    /// - Throws: An error if sign out fails.
    func signOut() async throws {
        self.currentUser = nil
        self.isUserLoggedIn = false
    }
    
    /// Deletes the currently authenticated user's account.
    /// - Throws: An error if account deletion fails.
    func deleteAccount() async throws {
        self.currentUser = nil
        self.isUserLoggedIn = false
    }
}

// MARK: - MockUser

/// A mock user for testing purposes.
class MockUser: AuthUser {
    var uid: String
    
    /// Initializes a MockUser with a unique identifier.
    /// - Parameter uid: The unique identifier for the user.
    init(uid: String) {
        self.uid = uid
    }
}
