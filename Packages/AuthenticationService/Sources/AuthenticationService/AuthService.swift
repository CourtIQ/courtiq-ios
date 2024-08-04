//
//  AuthManager.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import SwiftUI

// MARK: - AuthService

@available(iOS 14.0, *)
@MainActor
public class AuthService: AuthServiceProtocol {

    // MARK: - Properties

    private let authProvider: AuthProviderProtocol
    
    @Published public private(set) var currentUser: AuthUser?
    @AppStorage("isUserLoggedIn") public var isUserLoggedIn: Bool = false
    @AppStorage("additionalInfoNeeded") public var additionalInfoNeeded: Bool = false
    @AppStorage("currentUserUID") public var currentUserUID: String?

    // MARK: - Initializer
    
    /// Initializes the AuthService with a specified AuthProvider.
    /// - Parameter provider: The authentication provider to be used.
    public init(provider: AuthProviderProtocol) {
        self.authProvider = provider
        self.currentUser = provider.currentUser
        self.isUserLoggedIn = provider.isUserLoggedIn
        self.currentUserUID = provider.currentUser?.uid
    }
    
    // MARK: - Authentication Methods
    
    /// Signs up a user with the provided email and password.
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password of the user.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign up fails.
    public func signUp(email: String, password: String) async throws -> AuthUser {
        let user = try await authProvider.signUp(email: email, password: password)
        await MainActor.run {
            self.currentUser = user
            self.isUserLoggedIn = true
            self.additionalInfoNeeded = true
            self.currentUserUID = user.uid
        }
        return user
    }
    
    /// Signs in a user with the provided email and password.
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password of the user.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign in fails.
    public func signIn(email: String, password: String) async throws -> AuthUser {
        let user = try await authProvider.signIn(email: email, password: password)
        await MainActor.run {
            self.currentUser = user
            self.isUserLoggedIn = true
            self.currentUserUID = user.uid
        }
        return user
    }
    
    /// Signs in a user with Google authentication.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign in with Google fails.
    public func signInWithGoogle() async throws -> AuthUser {
        let user = try await authProvider.signInWithGoogle()
        await MainActor.run {
            self.currentUser = user
            self.isUserLoggedIn = true
            self.currentUserUID = user.uid
        }
        return user
    }
    
    /// Signs out the currently authenticated user.
    /// - Throws: An error if sign out fails.
    public func signOut() async throws {
        try await authProvider.signOut()
        await MainActor.run {
            self.currentUser = nil
            self.isUserLoggedIn = false
            self.currentUserUID = nil
        }
    }
    
    /// Deletes the currently authenticated user's account.
    /// - Throws: An error if account deletion fails.
    public func deleteAccount() async throws {
        try await authProvider.deleteAccount()
        await MainActor.run {
            self.currentUser = nil
            self.isUserLoggedIn = false
            self.currentUserUID = nil
        }
    }
    
    // MARK: - State Management
    
    /// Toggles the logged-in state of the user.
    @MainActor
    public func toggleLoggedInState() {
        self.isUserLoggedIn = true
    }
    
    /// Sets the additional information provided flag to false.
    @MainActor
    public func setAdditionalInfoProvided() {
        self.additionalInfoNeeded = false
    }
}
