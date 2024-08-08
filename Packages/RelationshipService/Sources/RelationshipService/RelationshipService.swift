//
//  RelationshipService.swift
//
//
//  Created by Pranav Suri on 08/04/2024.
//

import Foundation
import DataService
import SwiftUI

// MARK: - RelationshipService

@available(iOS 14.0, macOS 11.0, *)
public class RelationshipService: RelationshipServiceProtocol {
    
    // MARK: - Properties
    
    private var relationsService: DataService?
    private var relationRequestsService: DataService?
    private var relationsCollection: String = "relationships"
    private var relationRequestsCollection: String = "relationshipRequests"

    @AppStorage("currentUserUID") private var currentUserUIDStorage: String? {
        didSet {
            if let uid = currentUserUIDStorage {
                initializeServices(for: uid)
            }
        }
    }
    
    // MARK: - Initializer
    
    public init() {
        if let uid = currentUserUIDStorage {
            initializeServices(for: uid)
        }
    }
    
    // MARK: - Service Initialization
    
    private func initializeServices(for uid: String) {
        let relationshipProvider = FirestoreProvider(collectionPath: "users/\(uid)/\(relationsCollection)")
        let relationshipRequestProvider = FirestoreProvider(collectionPath: "users/\(uid)/\(relationRequestsCollection)")
        
        self.relationsService = DataService(provider: relationshipProvider)
        self.relationRequestsService = DataService(provider: relationshipRequestProvider)
    }
    
    // MARK: - RelationshipServiceProtocol Methods
    
    /// Sends a friend request from one user to another.
    /// - Parameters:
    ///   - from: The ID of the user sending the friend request.
    ///   - to: The ID of the user receiving the friend request.
    ///
    /// This method performs the following operations in the database:
    /// 1. Creates a friend request document with the details of the request.
    /// 2. Adds the friend request document to the sender's `relationshipRequests` collection.
    /// 3. Adds the friend request document to the receiver's `relationshipRequests` collection.
    ///
    /// If either operation fails, the method will throw an error. If both operations succeed,
    /// the method will complete successfully.
    @available(iOS 14.0, macOS 10.15, *)
    public func sendFriendRequest(from: String, to: String) async throws {
        guard let relationRequestsService = relationRequestsService else {
            throw NSError(domain: "Services not initialized", code: 500, userInfo: nil)
        }

        let request = RelationshipRequest(senderID: from,
                                          receiverID: to,
                                          requestType: .friend,
                                          createdAt: Date())

        // TODO: Fix the id of the document

        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            let dispatchGroup = DispatchGroup()
            var error: Error?

            dispatchGroup.enter()
            relationRequestsService.addDocument(collectionPath: "users/\(from)/\(relationRequestsCollection)", document: request) { result in
                if case .failure(let err) = result {
                    error = err
                }
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            relationRequestsService.addDocument(collectionPath: "users/\(to)/\(relationRequestsCollection)", document: request) { result in
                if case .failure(let err) = result {
                    error = err
                }
                dispatchGroup.leave()
            }

            dispatchGroup.notify(queue: .main) {
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: ())
                }
            }
        }
    }
    
    /// Accepts a friend request.
    /// - Parameter request: The `RelationshipRequest` object representing the friend request to be accepted.
    ///
    /// This method performs the following operations in the database:
    /// 1. Adds a relationship document to the sender's `relationshipsCollection`.
    /// 2. Adds a relationship document to the receiver's `relationshipsCollection`.
    /// 3. Deletes the relationship request document from the sender's `relationshipRequestsCollection`.
    /// 4. Deletes the relationship request document from the receiver's `relationshipRequestsCollection`.
    ///
    /// If any of these operations fail, the method will throw an error. If all operations succeed,
    /// the method will complete successfully.
    @available(iOS 14.0, macOS 10.15, *)
    public func acceptFriendRequest(request: RelationshipRequest) async throws {
        guard let relationsService = relationsService, let relationRequestsService = relationRequestsService else {
            throw NSError(domain: "Services not initialized", code: 500, userInfo: nil)
        }

        let currentUserId = request.receiverID
        let friendUserId = request.senderID
        let currentUserRelationship = Relationship(relatedUserID: friendUserId,
                                                   relationshipType: .friend,
                                                   createdAt: Date(),
                                                   updatedAt: Date())
        let friendUserRelationship = Relationship(relatedUserID: currentUserId,
                                                   relationshipType: .friend,
                                                   createdAt: Date(),
                                                   updatedAt: Date())
        
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            let dispatchGroup = DispatchGroup()
            var error: Error?

            dispatchGroup.enter()
            relationsService.addDocument(collectionPath: "users/\(currentUserId)/\(relationsCollection)", document: currentUserRelationship) { result in
                if case .failure(let err) = result {
                    error = err
                }
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            relationsService.addDocument(collectionPath: "users/\(friendUserId)/\(relationsCollection)", document: friendUserRelationship) { result in
                if case .failure(let err) = result {
                    error = err
                }
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            relationRequestsService.deleteDocument(collectionPath: "users/\(currentUserId)/\(relationRequestsCollection)", documentID: request.id) { result in
                if case .failure(let err) = result {
                    error = err
                }
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            relationRequestsService.deleteDocument(collectionPath: "users/\(friendUserId)/\(relationRequestsCollection)", documentID: request.id) { result in
                if case .failure(let err) = result {
                    error = err
                }
                dispatchGroup.leave()
            }

            dispatchGroup.notify(queue: .main) {
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: ())
                }
            }
        }
    }
    
    /// Fetches the list of friends for a user.
    /// - Parameters:
    ///   - userId: The ID of the user whose friends are being fetched.
    /// - Returns: An array of `Relationship` objects.
    @available(iOS 14.0, macOS 10.15, *)
    public func fetchFriends(userId: String) async throws -> [Relationship] {
        guard let relationsService = relationsService else {
            throw NSError(domain: "Services not initialized", code: 500, userInfo: nil)
        }
        
        let collectionPath = "users/\(userId)/\(relationsCollection)"
        let constraints: [QueryConstraint] = [.equalTo(field: "relationshipType", value: RelationshipType.friend.rawValue)]
        
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[Relationship], Error>) in
            relationsService.fetchDocuments(constraints: constraints) { (result: Result<[Relationship], Error>) in
                continuation.resume(with: result)
            }
        }
    }

    /// Finds mutual friends between two users.
    /// - Parameters:
    ///   - userId1: The ID of the first user.
    ///   - userId2: The ID of the second user.
    /// - Returns: An array of mutual friend `Relationship` objects.
    @available(iOS 14.0, macOS 10.15, *)
    public func fetchMutualFriends(userId1: String, userId2: String) async throws -> [Relationship] {
        throw NSError(domain: "Function not working", code: 500, userInfo: nil)
    }
    
    /// Removes a friend from a user's friend list.
    /// - Parameters:
    ///   - currentUserId: The ID of the user removing the friend.
    ///   - friendUserId: The ID of the friend being removed.
    @available(iOS 14.0, macOS 10.15, *)
    public func removeFriend(currentUserId: String, friendUserId: String) async throws {
        throw NSError(domain: "Function not working", code: 500, userInfo: nil)
    }
}
