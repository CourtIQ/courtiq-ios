//
//  FirebaseAuthService.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import FirebaseAuth
import SwiftUI

public class FirebaseAuthService: AuthProviderProtocol {
    private let userDefaults: UserDefaults
    private let currentUserKey = "currentUser"
    
    @AppStorage("isUserLoggedIn") private var isUserLoggedInStorage: Bool = false
    
    public init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        loadState()
    }
    
    public private(set) var currentUser: User? {
        didSet {
            saveState()
        }
    }
    
    public var isUserLoggedIn: Bool {
        return isUserLoggedInStorage
    }
    
    private func loadState() {
        if let userData = userDefaults.data(forKey: currentUserKey),
           let user = try? JSONDecoder().decode(FirebaseUser.self, from: userData) {
            self.currentUser = user
            self.isUserLoggedInStorage = true
        } else {
            self.isUserLoggedInStorage = false
        }
    }
    
    private func saveState() {
        if let user = currentUser as? FirebaseUser,
           let userData = try? JSONEncoder().encode(user) {
            userDefaults.set(userData, forKey: currentUserKey)
            isUserLoggedInStorage = true
        } else {
            userDefaults.removeObject(forKey: currentUserKey)
            isUserLoggedInStorage = false
        }
    }
    
    public func signUp(email: String, password: String) async throws -> User {
        return try await withCheckedThrowingContinuation { continuation in
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let user = authResult?.user {
                    let firebaseUser = FirebaseUser(uid: user.uid)
                    self.currentUser = firebaseUser
                    self.isUserLoggedInStorage = true
                    continuation.resume(returning: firebaseUser)
                } else {
                    continuation.resume(throwing: NSError(domain: "Unknown error", code: -1, userInfo: nil))
                }
            }
        }
    }
    
    public func signIn(email: String, password: String) async throws -> User {
        return try await withCheckedThrowingContinuation { continuation in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let user = authResult?.user {
                    let firebaseUser = FirebaseUser(uid: user.uid)
                    self.currentUser = firebaseUser
                    self.isUserLoggedInStorage = true
                    continuation.resume(returning: firebaseUser)
                } else {
                    continuation.resume(throwing: NSError(domain: "Unknown error", code: -1, userInfo: nil))
                }
            }
        }
    }
    
    public func signInWithGoogle() async throws -> User {
        // Implement Google Sign-In logic here using async/await
        throw NSError(domain: "NotImplemented", code: -1, userInfo: nil)
    }
    
    public func signOut() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            do {
                try Auth.auth().signOut()
                self.currentUser = nil
                self.isUserLoggedInStorage = false
                continuation.resume(returning: ())
            } catch let signOutError as NSError {
                continuation.resume(throwing: signOutError)
            }
        }
    }
    
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
                    continuation.resume(returning: ())
                }
            }
        }
    }
}

public struct FirebaseUser: Codable, User {
    public var uid: String
}

public protocol User {
    var uid: String { get }
}
