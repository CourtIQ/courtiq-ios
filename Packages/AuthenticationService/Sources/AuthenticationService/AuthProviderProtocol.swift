//
//  AuthServiceProtocol.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import FirebaseAuth

@available(iOS 13.0.0, *)
public protocol AuthProviderProtocol: AnyObject {
    var currentUser: AuthUser? { get }
    var isUserLoggedIn: Bool { get }

    func signUp(email: String, password: String) async throws -> AuthUser
    func signIn(email: String, password: String) async throws -> AuthUser
    func signInWithGoogle() async throws -> AuthUser
    func signOut() async throws
    func deleteAccount() async throws
}

@available(iOS 13.0.0, *)
final class MockAuthProvider: AuthProviderProtocol {
    var currentUser: (any AuthUser)? = MockUser(uid: UUID().uuidString)
    
    // MARK: Internal
    
    var isUserLoggedIn: Bool = false
    
    func signUp(email: String, password: String) async throws -> AuthUser {
        let mockUser = MockUser(uid: UUID().uuidString)
        self.currentUser = mockUser
        self.isUserLoggedIn = true
        return mockUser
    }
    
    func signIn(email: String, password: String) async throws -> AuthUser {
        let mockUser = MockUser(uid: UUID().uuidString)
        self.currentUser = mockUser
        self.isUserLoggedIn = true
        return mockUser
    }
    
    func signInWithGoogle() async throws -> AuthUser {
        let mockUser = MockUser(uid: UUID().uuidString)
        self.currentUser = mockUser
        self.isUserLoggedIn = true
        return mockUser
    }
    
    func signOut() async throws {
        self.currentUser = nil
        self.isUserLoggedIn = false
    }
    
    func deleteAccount() async throws {
        self.currentUser = nil
        self.isUserLoggedIn = false
    }
}

// MARK: - MockUser

class MockUser: AuthUser {
    var uid: String
    
    init(uid: String) {
        self.uid = uid
    }
}
