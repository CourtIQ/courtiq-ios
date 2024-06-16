//
//  AuthManager.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import FirebaseAuth

@MainActor
public class AuthManager: AuthManagerProtocol {
    private let authService: AuthServiceProtocol
    
    @Published public private(set) var currentUser: User?
    @Published public private(set) var isUserLoggedIn: Bool
    
    public init(authService: AuthServiceProtocol) {
        self.authService = authService
        self.currentUser = authService.currentUser
        self.isUserLoggedIn = authService.isUserLoggedIn
    }
    
    public func signUp(email: String, password: String) async throws -> User {
        let user = try await authService.signUp(email: email, password: password)
        self.currentUser = user
        self.isUserLoggedIn = authService.isUserLoggedIn
        return user
    }
    
    public func signIn(email: String, password: String) async throws -> User {
        let user = try await authService.signIn(email: email, password: password)
        self.currentUser = user
        self.isUserLoggedIn = authService.isUserLoggedIn
        return user
    }
    
    public func signInWithGoogle() async throws -> User {
        let user = try await authService.signInWithGoogle()
        self.currentUser = user
        self.isUserLoggedIn = authService.isUserLoggedIn
        return user
    }
    
    public func signOut() async throws {
        try await authService.signOut()
        self.currentUser = authService.currentUser
        self.isUserLoggedIn = authService.isUserLoggedIn
    }
    
    public func deleteAccount() async throws {
        try await authService.deleteAccount()
        self.currentUser = authService.currentUser
        self.isUserLoggedIn = authService.isUserLoggedIn
    }
}
