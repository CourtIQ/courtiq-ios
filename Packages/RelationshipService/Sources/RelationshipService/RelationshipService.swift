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
            resetData()
            return
        }

        initializeServices(for: uid)
    }

    private func resetData() {
        friends = []
        clubs = []
        coaches = []
        friendRequests = []
        clubRequests = []
        coachRequests = []
        relationsService = nil
        relationRequestsService = nil
    }

    private func fetchInitialData(for uid: String) async {
        do {
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

    @available(iOS 14.0, macOS 10.15, *)
    public func sendFriendRequest(request: RelationRequest) async throws {
        guard let relationRequestsService = relationRequestsService else {
            throw NSError(domain: "Services not initialized", code: 500, userInfo: nil)
        }

        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            relationRequestsService.addDocument(
                collectionPath: "users/\(request.receiverID)/\(relationRequestsCollection)",
                document: request
            ) { result in
                switch result {
                case .success:
                    continuation.resume(returning: ())
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }


    @available(iOS 14.0, macOS 10.15, *)
    public func acceptFriendRequest(request: RelationRequest) async throws {
        guard let relationsService = relationsService, let relationRequestsService = relationRequestsService else {
            throw NSError(domain: "Services not initialized", code: 500, userInfo: nil)
        }

        let currentUserId = request.receiverID
        let friendUserId = request.senderID
        let currentUserRelationship = Relation(
            relatedUserID: friendUserId,
            relationshipType: .friend,
            createdAt: Date(),
            updatedAt: Date()
        )
        let friendUserRelationship = Relation(
            relatedUserID: currentUserId,
            relationshipType: .friend,
            createdAt: Date(),
            updatedAt: Date()
        )

        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            let dispatchGroup = DispatchGroup()
            var error: Error?

            dispatchGroup.enter()
            relationsService.addDocument(
                collectionPath: "users/\(currentUserId)/\(relationsCollection)",
                document: currentUserRelationship
            ) { result in
                if case .failure(let err) = result {
                    error = err
                }
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            relationsService.addDocument(
                collectionPath: "users/\(friendUserId)/\(relationsCollection)",
                document: friendUserRelationship
            ) { result in
                if case .failure(let err) = result {
                    error = err
                }
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            relationRequestsService.deleteDocument(
                collectionPath: "users/\(currentUserId)/\(relationRequestsCollection)",
                documentID: request.id
            ) { result in
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

    @available(iOS 14.0, macOS 10.15, *)
    public func fetchFriends(userId: String) async throws -> [Relation] {
        guard let relationsService = relationsService else {
            throw NSError(domain: "Services not initialized", code: 500, userInfo: nil)
        }

        let constraints: [QueryConstraint] = [.equalTo(field: "relationshipType", value: RelationType.friend.rawValue)]

        return try await withCheckedThrowingContinuation { continuation in
            relationsService.fetchDocuments(constraints: constraints) { (result: Result<[Relation], Error>) in
                continuation.resume(with: result)
            }
        }
    }

    @available(iOS 14.0, macOS 10.15, *)
    public func fetchRelations(userId: String) async throws -> [Relation] {
        guard let relationsService = relationsService else {
            throw NSError(domain: "Services not initialized", code: 500, userInfo: nil)
        }

        return try await withCheckedThrowingContinuation { continuation in
            relationsService.fetchDocuments(
                collectionPath: "users/\(userId)/\(relationsCollection)",
                constraints: []
            ) { result in
                continuation.resume(with: result)
            }
        }
    }

    @available(iOS 14.0, macOS 10.15, *)
    public func fetchRelationRequests(userId: String) async throws -> [RelationRequest] {
        guard let relationRequestsService = relationRequestsService else {
            throw NSError(domain: "Services not initialized", code: 500, userInfo: nil)
        }

        return try await withCheckedThrowingContinuation { continuation in
            relationRequestsService.fetchDocuments(
                collectionPath: "users/\(userId)/\(relationRequestsCollection)",
                constraints: nil
            ) { result in
                continuation.resume(with: result)
            }
        }
    }

    @available(iOS 14.0, macOS 10.15, *)
    public func fetchMutualFriends(userId1: String, userId2: String) async throws -> [Relation] {
        throw NSError(domain: "Function not implemented", code: 500, userInfo: nil)
    }

    @available(iOS 14.0, macOS 10.15, *)
    public func removeFriend(relation: Relation) async throws {
        throw NSError(domain: "Function not implemented", code: 500, userInfo: nil)
    }

    // MARK: - New Functions

    @available(iOS 14.0, macOS 10.15, *)
    public func getFriendCount(for userId: String) async throws -> Int {
        let friends = try await fetchFriends(userId: userId)
        return friends.count
    }

    @available(iOS 14.0, macOS 10.15, *)
    public func getClubCount(for userId: String) async throws -> Int {
        let clubs = try await fetchRelations(userId: userId).filter { $0.relationType == .group }
        return clubs.count
    }
}
