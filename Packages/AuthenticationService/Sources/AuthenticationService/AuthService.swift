//
//  AuthService.swift
//
//  Created by Pranav Suri on 2024-06-15.
//

import SwiftUI

/// A main authentication service class that implements AuthServiceProtocol.
///
/// AuthService coordinates with an AuthProviderProtocol to perform authentication operations.
/// It manages `isUserLoggedIn` and `additionalInfoRequired` states using @AppStorage for persistence.
/// This class is @MainActor and ObservableObject, allowing SwiftUI views to automatically
/// respond to state changes.
@available(iOS 14.0, *)
@MainActor
public class AuthService: AuthServiceProtocol {

    // MARK: - Properties
    
    private let authProvider: AuthProviderProtocol

    @AppStorage("isUserLoggedIn") public var isUserLoggedIn: Bool = false
    @AppStorage("additionalInfoRequired") public var additionalInfoRequired: Bool = false

    // MARK: - Initialization
    
    /// Initializes the AuthService with the given authentication provider.
    /// Call `configure()` after initialization to ensure that states are up to date.
    public init(provider: AuthProviderProtocol) {
        self.authProvider = provider
        self.isUserLoggedIn = provider.isUserLoggedIn
    }

    /// Optionally call this after app startup to ensure the user's authentication state is correct.
    /// For example, you might want to verify the token is still valid.
    public func configure() async {
        guard isUserLoggedIn else { return }

        // Attempt to get a fresh ID token to validate user session.
        // If this fails, consider the user logged out.
        do {
            _ = try await authProvider.getIDToken()
        } catch {
            // Could be token expiration or other auth issue.
            // Consider the user no longer logged in.
            isUserLoggedIn = false
            additionalInfoRequired = false
        }
    }

    // MARK: - Authentication Methods
    
    public func signUp(email: String, password: String) async throws {
        try await authProvider.signUp(email: email, password: password)
        isUserLoggedIn = true
        // Assume new users need additional info
        additionalInfoRequired = true
    }

    public func signIn(email: String, password: String) async throws {
        try await authProvider.signIn(email: email, password: password)
        isUserLoggedIn = true
        // `additionalInfoRequired` remains as is; it can be updated as needed based on backend logic
    }

    public func signInWithGoogle() async throws {
        try await authProvider.signInWithGoogle()
        isUserLoggedIn = true
        // `additionalInfoRequired` can be updated as needed based on backend logic
    }

    public func signOut() async throws {
        try await authProvider.signOut()
        isUserLoggedIn = false
        additionalInfoRequired = false
    }

    public func deleteAccount() async throws {
        try await authProvider.deleteAccount()
        isUserLoggedIn = false
        additionalInfoRequired = false
    }

    // MARK: - Token Retrieval

    public func getIDToken() async throws -> String {
        do {
            return try await authProvider.getIDToken()
        } catch {
            isUserLoggedIn = false
            additionalInfoRequired = false
            throw error
        }
    }

    // MARK: - State Management

    public func setAdditionalInfoProvided() {
        additionalInfoRequired = false
    }
}
