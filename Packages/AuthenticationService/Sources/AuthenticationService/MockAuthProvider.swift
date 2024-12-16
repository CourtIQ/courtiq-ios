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
    
    // MARK: - Properties
    
    var isUserLoggedIn: Bool = false
    
    // MARK: - Initialization
    
    // No initialization needed for a mock.
    
    func configure() async {
        // For a mock, we can assume no additional configuration is needed.
        // If needed, you could set isUserLoggedIn based on some mock logic.
    }
    
    // MARK: - Authentication Methods
    
    func signUp(email: String, password: String) async throws {
        // Pretend sign up succeeded
        isUserLoggedIn = true
    }
    
    func signIn(email: String, password: String) async throws {
        // Pretend sign in succeeded
        isUserLoggedIn = true
    }
    
    func signInWithGoogle() async throws {
        // Pretend Google sign in succeeded
        isUserLoggedIn = true
    }
    
    func signOut() async throws {
        // Pretend sign out succeeded
        isUserLoggedIn = false
    }
    
    func deleteAccount() async throws {
        // Pretend account deletion succeeded
        isUserLoggedIn = false
    }
    
    func updateUserProfile(displayName: String?, photoURL: String?) async throws {
        guard isUserLoggedIn else {
            throw NSError(domain: "MockAuthProvider", code: -1, userInfo: [NSLocalizedDescriptionKey: "No user is currently signed in."])
        }
        
        // In a mock, we do nothing meaningful here.
        // If needed, print logs or store mock state.
        if let displayName = displayName {
            print("Mock: Updated displayName to \(displayName)")
        }
        
        if let photoURL = photoURL {
            print("Mock: Updated photoURL to \(photoURL)")
        }
    }
    
    // MARK: - Token Retrieval
    
    func getIDToken() async throws -> String {
        guard isUserLoggedIn else {
            throw NSError(
                domain: "MockAuthProvider",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "No user is currently signed in."]
            )
        }
        
        // Return a mock token.
        return "mock_id_token"
    }
}
