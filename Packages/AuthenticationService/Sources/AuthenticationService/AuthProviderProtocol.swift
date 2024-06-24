//
//  AuthServiceProtocol.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import FirebaseAuth

public protocol AuthProviderProtocol: AnyObject {
    var currentUser: User? { get }
    var isUserLoggedIn: Bool { get }

    func signUp(email: String, password: String) async throws -> User
    func signIn(email: String, password: String) async throws -> User
    func signInWithGoogle() async throws -> User
    func signOut() async throws
    func deleteAccount() async throws
}

final class MockAuthProvider: AuthProviderProtocol {
    var currentUser: (any User)? = MockUser(uid: UUID().uuidString)
    
    // MARK: Internal
    
    var isUserLoggedIn: Bool = false
    
    func signUp(email: String, password: String) async throws -> User {
        let mockUser = MockUser(uid: UUID().uuidString)
        self.currentUser = mockUser
        self.isUserLoggedIn = true
        return mockUser
    }
    
    func signIn(email: String, password: String) async throws -> User {
        let mockUser = MockUser(uid: UUID().uuidString)
        self.currentUser = mockUser
        self.isUserLoggedIn = true
        return mockUser
    }
    
    func signInWithGoogle() async throws -> User {
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

class MockUser: User {
    var uid: String
    
    init(uid: String) {
        self.uid = uid
    }
}
