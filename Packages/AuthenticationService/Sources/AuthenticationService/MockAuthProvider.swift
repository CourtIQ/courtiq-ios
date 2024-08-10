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
    
    /// Updates the authenticated user's profile information.
    /// - Parameters:
    ///   - displayName: The display name of the user (optional).
    ///   - photoURL: The URL of the user's profile picture as a string (optional).
    /// - Throws: An error if the update fails.
    func updateUserProfile(displayName: String?, photoURL: String?) async throws {
        guard let mockUser = currentUser as? MockUser else {
            throw NSError(domain: "MockAuthProvider", code: -1, userInfo: [NSLocalizedDescriptionKey: "No user is currently signed in."])
        }

        // Update mock user's properties (if needed)
        if let displayName = displayName {
            print("Mock: Updated displayName to \(displayName)")
        }

        if let photoURL = photoURL {
            print("Mock: Updated photoURL to \(photoURL)")
        }
    }
}

// MARK: - MockUser

/// A mock user for testing purposes.
class MockUser: AuthUser {
    
    /// The unique identifier for the user.
    var uid: String
    
    /// Initializes a MockUser with a unique identifier.
    /// - Parameter uid: The unique identifier for the user.
    init(uid: String) {
        self.uid = uid
    }
}
