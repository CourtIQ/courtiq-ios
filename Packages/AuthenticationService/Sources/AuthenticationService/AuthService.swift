//
//  AuthManager.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import SwiftUI

@available(iOS 14.0, *)
@MainActor
public class AuthService: AuthServiceProtocol {
    private let authProvider: AuthProviderProtocol
    
    @Published public private(set) var currentUser: AuthUser?
    @AppStorage("isUserLoggedIn") public var isUserLoggedIn: Bool = false
    
    public init(provider: AuthProviderProtocol) {
        self.authProvider = provider
        self.currentUser = provider.currentUser
        self.isUserLoggedIn = provider.isUserLoggedIn
    }
    
    public func signUp(email: String, password: String) async throws -> AuthUser {
        let user = try await authProvider.signUp(email: email, password: password)
        self.currentUser = user
        return user
    }
    
    public func signIn(email: String, password: String) async throws -> AuthUser{
        let user = try await authProvider.signIn(email: email, password: password)
        self.currentUser = user
        self.isUserLoggedIn = true
        return user
    }
    
    public func signInWithGoogle() async throws -> AuthUser {
        let user = try await authProvider.signInWithGoogle()
        self.currentUser = user
        self.isUserLoggedIn = true
        return user
    }
    
    public func signOut() async throws {
        try await authProvider.signOut()
        self.currentUser = nil
        self.isUserLoggedIn = false
    }
    
    public func deleteAccount() async throws {
        try await authProvider.deleteAccount()
        self.currentUser = nil
        self.isUserLoggedIn = false
    }
    
    @MainActor
    public func toggleLoggedInState() {
        self.isUserLoggedIn = true
    }
}
