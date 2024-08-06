//
//  FirebaseAuthProvider.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import FirebaseAuth
import SwiftUI

// MARK: - FirebaseAuthProvider

@available(iOS 14.0, *)
public class FirebaseAuthProvider: AuthProviderProtocol {
    
    // MARK: - Properties
    
    @AppStorage("isUserLoggedIn") private var isUserLoggedInStorage: Bool = false
    @AppStorage("currentUserUID") private var currentUserUIDStorage: String?
    
    public private(set) var currentUser: AuthUser?
    
    // MARK: - Initializer
    
    /// Initializes the FirebaseAuthProvider and sets default values.
    public init() {
        if let user = Auth.auth().currentUser {
            self.currentUser = FirebaseUser(uid: user.uid)
            self.isUserLoggedInStorage = true
            self.currentUserUIDStorage = user.uid
        } else {
            self.currentUser = nil
            self.isUserLoggedInStorage = false
            self.currentUserUIDStorage = nil
        }
    }
    
    /// A Boolean value indicating whether a user is logged in.
    public var isUserLoggedIn: Bool {
        return isUserLoggedInStorage
    }
    
    // MARK: - Authentication Methods
    
    /// Signs up a user with the provided email and password.
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password of the user.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign up fails.
    public func signUp(email: String, password: String) async throws -> AuthUser {
        return try await withCheckedThrowingContinuation { continuation in
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let user = authResult?.user {
                    let firebaseUser = FirebaseUser(uid: user.uid)
                    self.currentUser = firebaseUser
                    self.isUserLoggedInStorage = true
                    self.currentUserUIDStorage = self.currentUser?.uid
                    continuation.resume(returning: firebaseUser)
                } else {
                    continuation.resume(throwing: NSError(domain: "Unknown error", code: -1, userInfo: nil))
                }
            }
        }
    }
    
    /// Signs in a user with the provided email and password.
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - password: The password of the user.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign in fails.
    public func signIn(email: String, password: String) async throws -> AuthUser {
        return try await withCheckedThrowingContinuation { continuation in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let user = authResult?.user {
                    let firebaseUser = FirebaseUser(uid: user.uid)
                    self.currentUser = firebaseUser
                    self.isUserLoggedInStorage = true
                    self.currentUserUIDStorage = self.currentUser?.uid
                    continuation.resume(returning: firebaseUser)
                } else {
                    continuation.resume(throwing: NSError(domain: "Unknown error", code: -1, userInfo: nil))
                }
            }
        }
    }
    
    /// Signs in a user with Google authentication.
    /// - Returns: The authenticated user.
    /// - Throws: An error if sign in with Google fails.
    public func signInWithGoogle() async throws -> AuthUser {
        // Implement Google Sign-In logic here using async/await
        throw NSError(domain: "NotImplemented", code: -1, userInfo: nil)
    }
    
    /// Signs out the currently authenticated user.
    /// - Throws: An error if sign out fails.
    public func signOut() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            do {
                try Auth.auth().signOut()
                self.currentUser = nil
                self.isUserLoggedInStorage = false
                self.currentUserUIDStorage = nil
                continuation.resume(returning: ())
            } catch let signOutError as NSError {
                continuation.resume(throwing: signOutError)
            }
        }
    }
    
    /// Deletes the currently authenticated user's account.
    /// - Throws: An error if account deletion fails.
    public func deleteAccount() async throws {
        guard let user = Auth.auth().currentUser else {
            throw NSError(domain: "No current user", code: 0, userInfo: nil)
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            user.delete { error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    self.currentUser = nil
                    self.isUserLoggedInStorage = false
                    self.currentUserUIDStorage = nil
                    continuation.resume(returning: ())
                }
            }
        }
    }
}

// MARK: - FirebaseUser

/// A representation of a Firebase authenticated user.
public struct FirebaseUser: Codable, AuthUser {
    public var uid: String
}

// MARK: - AuthUser Protocol

/// A protocol representing an authenticated user.
public protocol AuthUser {
    var uid: String { get }
}
