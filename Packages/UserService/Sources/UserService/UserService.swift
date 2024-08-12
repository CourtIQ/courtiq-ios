//
//  UserService.swift
//
//
//  Created by Pranav Suri on 07/04/2024.
//

import DataService
import SwiftUI

// MARK: - UserService

/// A service responsible for managing user data.
@available(iOS 14.0, *)
@MainActor
public class UserService: UserServiceProtocol, ObservableObject {
    
    // MARK: - Properties
    
    @AppStorage("currentUserUID") private var currentUserUIDStorage: String?
    
    @Published private(set) public var currentUser: User?
    private let dataService: DataServiceProtocol

    // MARK: - Initializer
    
    /// Initializes the UserService with a specified DataService.
    /// - Parameter dataService: The data service to be used for fetching and updating user data.
    public init(dataService: DataServiceProtocol = DataService(provider: FirestoreProvider(collectionPath: "users"))) {
        self.dataService = dataService
        Task {
            await self.loadCurrentUser()
        }
    }
    
    // MARK: - Load Current User
    
    /// Loads the current user from local storage or fetches from the data service if not available locally.
    @MainActor
    private func loadCurrentUser() async {
        guard let userID = currentUserUIDStorage else {
            self.currentUser = nil
            return
        }
        
        do {
            let user = try await fetchCurrentUser(userID: userID)
            self.currentUser = user
        } catch {
            self.currentUser = nil
        }
    }

    // MARK: - Fetch Current User
    
    /// Fetches the current user from the data service.
    /// - Parameter userID: The ID of the user to be fetched.
    /// - Returns: The fetched user.
    /// - Throws: An error if fetching the user fails.
    public func fetchCurrentUser(userID: String) async throws -> User {
        return try await withCheckedThrowingContinuation { continuation in
            dataService.fetchDocument(documentID: userID) { (result: Result<User, Error>) in
                switch result {
                case .success(let user):
                    continuation.resume(returning: user)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    // MARK: - Update Current User
    
    /// Updates the current user's data in the data service.
    /// - Parameters:
    ///   - userID: The ID of the user to be updated.
    ///   - data: The new user data to be updated.
    /// - Throws: An error if updating the user data fails.
    public func updateCurrentUser(userID: String, data: User) async throws {
        try await withCheckedThrowingContinuation { [weak self] (continuation: CheckedContinuation<Void, Error>) in
            guard let self = self else {
                continuation.resume(throwing: NSError(domain: "UserService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Self is nil"]))
                return
            }

            self.dataService.updateDocument(documentID: userID, document: data) { result in
                switch result {
                case .success:
                    Task {
                        do {
                            let user = try await self.fetchCurrentUser(userID: userID)
                            self.currentUser = user
                            self.currentUserUIDStorage = userID
                            continuation.resume(returning: ())
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    // MARK: - Fetch User by ID
    
    /// Fetches a user by ID from the data service.
    /// - Parameter userID: The ID of the user to be fetched.
    /// - Returns: The fetched user.
    /// - Throws: An error if fetching the user fails.
    public func fetchUser(byID userID: String) async throws -> User {
        return try await withCheckedThrowingContinuation { continuation in
            dataService.fetchDocument(documentID: userID) { (result: Result<User, Error>) in
                switch result {
                case .success(let user):
                    continuation.resume(returning: user)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    // MARK: - Start Listening for Current User
    
    /// Starts listening for changes to the current user.
    /// - Parameter userID: The ID of the user to listen for changes.
    /// - Parameter onChange: A closure to be called when the user data changes.
    public func startListeningForCurrentUser(userID: String, onChange: @escaping (Result<User, Error>) -> Void) {
        // Implementation to start listening for user changes
    }

    // MARK: - Stop Listening
    
    /// Stops listening for changes to the current user.
    public func stopListening() {
        // Implementation to stop listening for user changes
    }
}
