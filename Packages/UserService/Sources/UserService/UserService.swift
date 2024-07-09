//
//  UserService.swift
//
//
//  Created by Pranav Suri on 07/04/2024.
//

import DataService
import SwiftUI

@available(iOS 14.0, *)
public class UserService: UserServiceProtocol {
    @Published private(set) public var currentUser: User?
    var dataService: DataServiceProtocol

    // MARK: - Initializer
    
    public init(dataService: DataServiceProtocol = DataService(provider: FirestoreProvider(collection: "users"))) {
        self.dataService = dataService
    }

    // MARK: - Fetch Current User
    
    public func fetchCurrentUser(userID: String, completion: @escaping (Result<User, Error>) -> Void) {
        dataService.fetchDocument(documentID: userID) { [weak self] (result: Result<User, Error>) in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self?.currentUser = user
                }
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // MARK: - Update Current User
    
    public func updateCurrentUser(userID: String, data: User, completion: @escaping (Result<Void, Error>) -> Void) {
        dataService.updateDocument(documentID: userID, document: data) { [weak self] result in
            switch result {
            case .success:
                self?.fetchCurrentUser(userID: userID, completion: { result in
                    switch result {
                    case .success(let user):
                        DispatchQueue.main.async {
                            self?.currentUser = user
                        }
                        completion(.success(()))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // MARK: - Delete Current User
    
    public func deleteCurrentUser(userID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        dataService.deleteDocument(documentID: userID) { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self?.currentUser = nil
                }
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // MARK: - Fetch User by ID
    
    public func fetchUser(byID userID: String, completion: @escaping (Result<User, Error>) -> Void) {
        dataService.fetchDocument(documentID: userID) { (result: Result<User, Error>) in
            switch result {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // MARK: - Start Listening for Current User
    
    public func startListeningForCurrentUser(userID: String, onChange: @escaping (Result<User, Error>) -> Void) {
        print(#function)
    }

    // MARK: - Stop Listening
    
    public func stopListening() {
        print(#function)
    }
}
