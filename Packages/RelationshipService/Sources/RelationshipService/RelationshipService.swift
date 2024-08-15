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
@MainActor
public class RelationshipService: RelationshipServiceProtocol {
    
    // MARK: - Properties
    
    private var relationsService: DataService?
    private var relationRequestsService: DataService?
    private let relationsCollection: String = "relationships"
    private let relationRequestsCollection: String = "relationshipRequests"

    @MainActor
    @AppStorage("currentUserUID") private var currentUserUIDStorage: String? {
        didSet {
            Task {
                await handleCurrentUserChange()
            }
        }
    }
    
    @Published public private(set) var friends: [Relation] = []
    @Published public private(set) var clubs: [Relation] = []
    @Published public private(set) var coaches: [Relation] = []
    @Published public private(set) var friendRequests: [RelationRequest] = []
    @Published public private(set) var clubRequests: [RelationRequest] = []
    @Published public private(set) var coachRequests: [RelationRequest] = []
    
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
        Task {
            await fetchInitialData(for: uid)
        }
    }
    
    private func handleCurrentUserChange() async {
        guard let uid = currentUserUIDStorage else {
            friends = []
            clubs = []
            coaches = []
            relationsService = nil
            relationRequestsService = nil
            return
        }
        
        initializeServices(for: uid)
        await fetchInitialData(for: uid)
    }
    
    private func fetchInitialData(for uid: String) async {
        do {
            print(uid)
            let relations = try await fetchRelations(userId: uid)
            friends = relations.filter { $0.relationType == .friend }
            clubs = relations.filter { $0.relationType == .group }
            coaches = relations.filter { $0.relationType == .coach }
            
            let relationRequests = try await fetchRelationRequests(userId: uid)
            friendRequests = relationRequests.filter { $0.requestType == .friend }
            clubRequests = relationRequests.filter { $0.requestType == .group }
            coachRequests = relationRequests.filter { $0.requestType == .coach }
        } catch {
            print("Failed to fetch relations or relation requests: \(error)")
        }
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

        let request = RelationRequest(senderID: from,
                                      receiverID: to,
                                      requestType: .friend,
                                      createdAt: Date())

        // TODO: Fix the id of the document as right now the
        // TODO: id var in the struct is not consistent with the actual document id

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
    public func acceptFriendRequest(request: RelationRequest) async throws {
        guard let relationsService = relationsService, let relationRequestsService = relationRequestsService else {
            throw NSError(domain: "Services not initialized", code: 500, userInfo: nil)
        }

        let currentUserId = request.receiverID
        let friendUserId = request.senderID
        let currentUserRelationship = Relation(relatedUserID: friendUserId,
                                               relationshipType: .friend,
                                               createdAt: Date(),
                                               updatedAt: Date())
        let friendUserRelationship = Relation(relatedUserID: currentUserId,
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
    public func fetchFriends(userId: String) async throws -> [Relation] {
        guard let relationsService = relationsService else {
            throw NSError(domain: "Services not initialized", code: 500, userInfo: nil)
        }
        
        let constraints: [QueryConstraint] = [.equalTo(field: "relationshipType", value: RelationType.friend.rawValue)]
        
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[Relation], Error>) in
            relationsService.fetchDocuments(constraints: constraints) { (result: Result<[Relation], Error>) in
                continuation.resume(with: result)
            }
        }
    }

    /// Fetches the list of all relations for a user.
    /// - Parameters:
    ///   - userId: The ID of the user whose relations are being fetched.
    /// - Returns: An array of `Relation` objects.
    @available(iOS 14.0, macOS 10.15, *)
    public func fetchRelations(userId: String) async throws -> [Relation] {
        guard let relationsService = relationsService else {
            throw NSError(domain: "Services not initialized", code: 500, userInfo: nil)
        }

        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[Relation], Error>) in
            relationsService.fetchDocuments(collectionPath: "users/\(userId)/\(relationsCollection)", constraints: []) { (result: Result<[Relation], Error>) in
                continuation.resume(with: result)
            }
        }
    }

    /// Fetches the list of all relation requests for a user.
    /// - Parameters:
    ///   - userId: The ID of the user whose relation requests are being fetched.
    /// - Returns: An array of `RelationRequest` objects.
    @available(iOS 14.0, macOS 10.15, *)
    public func fetchRelationRequests(userId: String) async throws -> [RelationRequest] {
        guard let relationRequestsService = relationRequestsService else {
            throw NSError(domain: "Services not initialized", code: 500, userInfo: nil)
        }

        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[RelationRequest], Error>) in
            relationRequestsService.fetchDocuments(collectionPath: "users/\(userId)/\(relationRequestsCollection)", constraints: nil) { (result: Result<[RelationRequest], Error>) in
                print(result)
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
    public func fetchMutualFriends(userId1: String, userId2: String) async throws -> [Relation] {
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
