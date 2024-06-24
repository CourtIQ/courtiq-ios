//
//  AuthManagerProtocol.swift
//
//
//  Created by Pranav Suri on 2024-06-15.
//

import FirebaseAuth

@MainActor
public protocol AuthServiceProtocol: ObservableObject {
    var currentUser: User? { get }
    var isUserLoggedIn: Bool { get }
    
    func signUp(email: String, password: String) async throws
    func signIn(email: String, password: String) async throws
    func signInWithGoogle() async throws
    func signOut() async throws
    func deleteAccount() async throws
}
