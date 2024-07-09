//
//  AuthManagerProtocol.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import FirebaseAuth

@available(iOS 14.0, *)
@MainActor
public protocol AuthServiceProtocol: ObservableObject {
    var currentUser: AuthUser? { get }
    var isUserLoggedIn: Bool { get }
    
    func signUp(email: String, password: String) async throws -> AuthUser
    func signIn(email: String, password: String) async throws -> AuthUser
    func signInWithGoogle() async throws -> AuthUser
    func signOut() async throws
    func deleteAccount() async throws
    func toggleLoggedInState()
}
