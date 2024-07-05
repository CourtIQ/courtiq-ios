//
//  File.swift
//  
//
//  Created by Pranav Suri on 2024-07-04.
//

import Foundation

protocol UserServiceProtocol {
    var currentUser: User? { get }
    
    func fetchCurrentUser(userID: String, completion: @escaping (Result<User, Error>) -> Void)
    func updateCurrentUser(userID: String, data: User, completion: @escaping (Result<Void, Error>) -> Void)
    func deleteCurrentUser(userID: String, completion: @escaping (Result<Void, Error>) -> Void)
    func fetchUser(byID userID: String, completion: @escaping (Result<User, Error>) -> Void)
    func startListeningForCurrentUser(userID: String, onChange: @escaping (Result<User, Error>) -> Void)
    func stopListening()
}
