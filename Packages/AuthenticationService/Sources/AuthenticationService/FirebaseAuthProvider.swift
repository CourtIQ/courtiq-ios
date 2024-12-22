//
//  FirebaseAuthProvider.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import FirebaseAuth
import FirebaseCore
import SwiftUI

@available(iOS 14.0, *)
public class FirebaseAuthProvider: AuthProviderProtocol {
    
    // MARK: - Properties
    @AppStorage("isUserLoggedIn") private var isUserLoggedInStorage: Bool = false
    
    public var isUserLoggedIn: Bool {
        return isUserLoggedInStorage
    }
    
    // MARK: - Initialization
    public init() {
        // Rely on stored state.
    }
    
    /// Ensures the provider state is up to date by validating the current session if any.
    public func configure() async {
        if Auth.auth().currentUser != nil {
            do {
                _ = try await getIDToken()
                isUserLoggedInStorage = true
            } catch {
                isUserLoggedInStorage = false
            }
        } else {
            isUserLoggedInStorage = false
        }
    }
    
    // MARK: - Authentication Methods
    
    public func signUp(email: String, password: String) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            Auth.auth().createUser(withEmail: email, password: password) { _, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                // User created successfully.
                self.isUserLoggedInStorage = true
                continuation.resume(returning: ())
            }
        }

    }
    
    public func signIn(email: String, password: String) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            Auth.auth().signIn(withEmail: email, password: password) { _, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                self.isUserLoggedInStorage = true
                continuation.resume(returning: ())
            }
        }
    }
    
    public func signInWithGoogle() async throws {
        // Implement Google Sign-In logic using async/await if needed
        throw NSError(domain: "NotImplemented", code: -1, userInfo: nil)
    }
    
    public func signOut() async throws {
        try await withCheckedThrowingContinuation { continuation in
            do {
                try Auth.auth().signOut()
                self.isUserLoggedInStorage = false
                continuation.resume(returning: ())
            } catch {
                continuation.resume(throwing: error)
            }
        }
    }
    
    public func deleteAccount() async throws {
        guard let user = Auth.auth().currentUser else {
            throw NSError(domain: "No current user", code: 0, userInfo: nil)
        }
        
        try await withCheckedThrowingContinuation {(continuation: CheckedContinuation<Void, Error>) in
            user.delete { error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    self.isUserLoggedInStorage = false
                    continuation.resume(returning: ())
                }
            }
        }
    }
    
    // MARK: - User Profile Update
    
    public func updateUserProfile(displayName: String?, photoURL: String?) async throws {
        guard let user = Auth.auth().currentUser else {
            throw NSError(domain: "FirebaseAuthProvider", code: -1, userInfo: [NSLocalizedDescriptionKey: "No user is currently signed in."])
        }

        let changeRequest = user.createProfileChangeRequest()
        if let displayName = displayName {
            changeRequest.displayName = displayName
        }
        if let photoURLString = photoURL, let url = URL(string: photoURLString) {
            changeRequest.photoURL = url
        }

        try await changeRequest.commitChanges()
    }
    
    // MARK: - Token Retrieval
    
    public func getIDToken() async throws -> String {
        guard let user = Auth.auth().currentUser else {
            // User is not signed in.
            isUserLoggedInStorage = false
            throw NSError(domain: "No user signed in", code: 0, userInfo: nil)
        }
                
        return try await withCheckedThrowingContinuation { continuation in
            user.getIDTokenForcingRefresh(true) { token, error in
                if let error = error {
                    // Token retrieval failed.
                    self.isUserLoggedInStorage = false
                    continuation.resume(throwing: error)
                } else if let token = token {
                    continuation.resume(returning: token)
                } else {
                    self.isUserLoggedInStorage = false
                    continuation.resume(throwing: NSError(domain: "Unknown error retrieving token", code: -1, userInfo: nil))
                }
            }
        }
    }
    
    public func configureFirebase() {
        FirebaseApp.configure()
    }
}
