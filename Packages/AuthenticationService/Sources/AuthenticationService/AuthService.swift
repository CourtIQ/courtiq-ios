//
//  AuthManager.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import FirebaseAuth

@MainActor
public class AuthService: AuthServiceProtocol {
    private let authProvider: AuthProviderProtocol
    
    @Published public private(set) var currentUser: User?
    @Published public private(set) var isUserLoggedIn: Bool
    
    public init(provider: AuthProviderProtocol) {
        self.authProvider = provider
        self.currentUser = provider.currentUser
        self.isUserLoggedIn = provider.isUserLoggedIn
    }
    
    public func signUp(email: String, password: String) async throws {
        let user = try await authProvider.signUp(email: email, password: password)
        self.currentUser = user
        self.isUserLoggedIn = authProvider.isUserLoggedIn
    }
    
    public func signIn(email: String, password: String) async throws {
        let user = try await authProvider.signIn(email: email, password: password)
        self.currentUser = user
        self.isUserLoggedIn = authProvider.isUserLoggedIn
    }
    
    public func signInWithGoogle() async throws {
        let user = try await authProvider.signInWithGoogle()
        self.currentUser = user
        self.isUserLoggedIn = authProvider.isUserLoggedIn
    }
    
    public func signOut() async throws {
        try await authProvider.signOut()
        self.currentUser = authProvider.currentUser
        self.isUserLoggedIn = authProvider.isUserLoggedIn
    }
    
    public func deleteAccount() async throws {
        try await authProvider.deleteAccount()
        self.currentUser = authProvider.currentUser
        self.isUserLoggedIn = authProvider.isUserLoggedIn
    }
}
