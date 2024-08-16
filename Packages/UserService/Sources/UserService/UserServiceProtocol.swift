//
//  UserServiceProtocol.swift
//
//
//  Created by Pranav Suri on 2024-07-04.
//

import Foundation

@available(iOS 13.0, *)
@MainActor
public protocol UserServiceProtocol: ObservableObject {
    var currentUser: User? { get }
    
    func fetchCurrentUser(userID: String) async throws -> User
    func updateCurrentUser(userID: String, data: User) async throws
    func fetchUser(byID userID: String) async throws -> User
    func isUsernameAvailable(username: String) async throws -> Bool
    func startListeningForCurrentUser(userID: String, onChange: @escaping (Result<User, Error>) -> Void)
    func stopListening()
}
