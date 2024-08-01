//
//  UserService.swift
//
//
//  Created by Pranav Suri on 07/04/2024.
//

import DataService
import SwiftUI

@available(iOS 14.0, *)
public class UserService: UserServiceProtocol, ObservableObject {
    @Published private(set) public var currentUser: User?
    private let dataService: DataServiceProtocol
    private let userDefaults: UserDefaults
    private let currentUserKey = "currentUser"  // Consistent with FirebaseAuthService

    // MARK: - Initializer
    
    public init(dataService: DataServiceProtocol = DataService(provider: FirestoreProvider(collection: "users")), userDefaults: UserDefaults = .standard) {
        self.dataService = dataService
        self.userDefaults = userDefaults
        loadCurrentUser()
    }
    
    // MARK: - Load Current User
    
    private func loadCurrentUser() {
        if let userID = userDefaults.string(forKey: currentUserKey) {
            Task {
                do {
                    let user = try await fetchCurrentUser(userID: userID)
                    await MainActor.run {
                        self.currentUser = user
                    }
                } catch {
                    print("Failed to fetch current user: \(error)")
                }
            }
        }
    }

    // MARK: - Fetch Current User
    
    public func fetchCurrentUser(userID: String) async throws -> User {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<User, Error>) in
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
                            await MainActor.run {
                                self.currentUser = user
                                self.userDefaults.set(userID, forKey: self.currentUserKey)  // Save the userID to UserDefaults
                            }
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
    
    public func fetchUser(byID userID: String) async throws -> User {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<User, Error>) in
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
    
    public func startListeningForCurrentUser(userID: String, onChange: @escaping (Result<User, Error>) -> Void) {
        print(#function)
    }

    // MARK: - Stop Listening
    
    public func stopListening() {
        print(#function)
    }
}
