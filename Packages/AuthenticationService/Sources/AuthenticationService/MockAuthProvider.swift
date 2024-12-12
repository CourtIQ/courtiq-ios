//
//  File.swift
//
//
//  Created by Pranav Suri on 2024-08-03.
//

import Foundation

// MARK: - MockAuthProvider

/// A mock authentication provider for testing purposes.
///
/// This class simulates the behavior of an authentication provider without contacting real servers.
/// It's useful for writing unit tests or prototyping UI without relying on a live back-end.
///
/// The mock maintains simple internal state and can return a mock user and token. Errors can be simulated
/// by modifying the logic if you want to test failure cases.
@available(iOS 13.0.0, *)
final class MockAuthProvider: AuthProviderProtocol {
    
    // MARK: - Internal Properties
    
    /// The currently authenticated user in the mock environment.
    var currentUser: (any AuthUser)? = MockUser(uid: UUID().uuidString)
    
    /// A Boolean value indicating whether a user is logged in.
    var isUserLoggedIn: Bool = false
    
    // MARK: - Authentication Methods
    
    /// Signs up a user with the provided email and password.
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password of the user.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign-up fails.
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
    /// - Throws: An error if sign-in fails.
    func signIn(email: String, password: String) async throws -> AuthUser {
        let mockUser = MockUser(uid: UUID().uuidString)
        self.currentUser = mockUser
        self.isUserLoggedIn = true
        return mockUser
    }
    
    /// Signs in a user with Google authentication.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign-in with Google fails.
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
    
    /// Updates the authenticated user's profile information.
    /// - Parameters:
    ///   - displayName: The display name of the user (optional).
    ///   - photoURL: The URL of the user's profile picture as a string (optional).
    /// - Throws: An error if the update fails.
    func updateUserProfile(displayName: String?, photoURL: String?) async throws {
        guard let _ = currentUser as? MockUser else {
            throw NSError(domain: "MockAuthProvider", code: -1, userInfo: [NSLocalizedDescriptionKey: "No user is currently signed in."])
        }

        // For a mock, just print out what would have changed.
        if let displayName = displayName {
            print("Mock: Updated displayName to \(displayName)")
        }

        if let photoURL = photoURL {
            print("Mock: Updated photoURL to \(photoURL)")
        }
    }
    
    // MARK: - Token Retrieval
    
    /// Retrieves an ID token for the currently authenticated user.
    ///
    /// In this mock implementation, the token is a fake string. It's useful for tests that need a token
    /// but don't require actual token validation.
    /// - Returns: A `String` representing a mock ID token.
    /// - Throws: An error if no user is currently signed in.
    func getIDToken() async throws -> String {
        guard isUserLoggedIn, let currentUser = currentUser else {
            throw NSError(
                domain: "MockAuthProvider",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "No user is currently signed in."]
            )
        }
        
        // Return a mock token that includes the user's UID, for traceability in tests.
        return "mock_id_token_for_\(currentUser.uid)"
    }
    
    public func getCustomClaims() async throws -> [String: Any] {
        return ["test": "claim"]
    }
}

// MARK: - MockUser

/// A mock user for testing purposes.
///
/// This class represents a simplified authenticated user model, identified by a `uid`.
/// It's used by `MockAuthProvider` to simulate authentication scenarios in a controlled environment.
class MockUser: AuthUser {
    
    /// The unique identifier for the user.
    var uid: String
    
    /// Initializes a MockUser with a unique identifier.
    /// - Parameter uid: The unique identifier for the user.
    init(uid: String) {
        self.uid = uid
    }
}
