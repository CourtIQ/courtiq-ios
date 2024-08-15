//
//  RelationshipServiceProtocol.swift
//
//
//  Created by Pranav Suri on 2024-08-04.
//

import Foundation

/// Protocol that defines the operations for a relationship service.
@available(iOS 14.0, *)
@MainActor
public protocol RelationshipServiceProtocol: ObservableObject {

    // MARK: - Published Properties
    
    /// An array of `Relation` objects representing the friends.
    var friends: [Relation] { get }
    
    /// An array of `Relation` objects representing the clubs.
    var clubs: [Relation] { get }
    
    /// An array of `Relation` objects representing the coaches.
    var coaches: [Relation] { get }
    
    /// An array of `RelationRequest` objects representing the friend requests.
    var friendRequests: [RelationRequest] { get }
    
    /// An array of `RelationRequest` objects representing the group requests.
    var clubRequests: [RelationRequest] { get }
    
    /// An array of `RelationRequest` objects representing the coach requests.
    var coachRequests: [RelationRequest] { get }

    // MARK: - Methods
    
    /// Sends a friend request.
    /// - Parameter request: The `RelationRequest` object representing the friend request to be sent.
    func sendFriendRequest(request: RelationRequest) async throws
    
    /// Accepts a friend request.
    /// - Parameter request: The `RelationRequest` object representing the friend request to be accepted.
    func acceptFriendRequest(request: RelationRequest) async throws
    
    /// Fetches the list of friends for a user.
    /// - Parameters:
    ///   - userId: The ID of the user whose friends are being fetched.
    /// - Returns: An array of `Relation` objects.
    func fetchFriends(userId: String) async throws -> [Relation]
    
    /// Finds mutual friends between two users.
    /// - Parameters:
    ///   - userId1: The ID of the first user.
    ///   - userId2: The ID of the second user.
    /// - Returns: An array of mutual friend `Relation` objects.
    func fetchMutualFriends(userId1: String, userId2: String) async throws -> [Relation]
    
    /// Removes a friend from a user's friend list.
    /// - Parameter relation: The `Relation` object representing the friendship to be removed.
    func removeFriend(relation: Relation) async throws
    
    /// Fetches the list of all relations for a user.
    /// - Parameters:
    ///   - userId: The ID of the user whose relations are being fetched.
    /// - Returns: An array of `Relation` objects.
    func fetchRelations(userId: String) async throws -> [Relation]
    
    /// Fetches the list of all relation requests for a user.
    /// - Parameters:
    ///   - userId: The ID of the user whose relation requests are being fetched.
    /// - Returns: An array of `RelationRequest` objects.
    func fetchRelationRequests(userId: String) async throws -> [RelationRequest]
}
