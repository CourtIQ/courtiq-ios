//
//  AuthManagerProtocol.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import FirebaseAuth

@MainActor
public protocol AuthManagerProtocol: ObservableObject {
    var currentUser: User? { get }
    var isUserLoggedIn: Bool { get }
    
    func signUp(email: String, password: String) async throws -> User
    func signIn(email: String, password: String) async throws -> User
    func signInWithGoogle() async throws -> User
    func signOut() async throws
    func deleteAccount() async throws
}
