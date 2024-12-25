//
//  RelationshipRepositoryProtocool.swift
//  SocialService
//
//  Created by Pranav on 2024-12-22.
//

import Foundation
import Models

// MARK: - RelationshipRepositoryProtocool

/// A protocol defining repository operations related to user relationships, such as friendships.
public protocol FriendshipRepositoryProtocol: Sendable {
    
    // MARK: - Friend Request Lifecycle
    
    /// Sends a friend request to another user.
    ///
    /// - Parameter receiverId: The unique identifier of the user to receive the friend request.
    /// - Returns: The `Friendship` object representing the newly created or updated friendship.
    func sendFriendRequest(to receiverId: String) async throws -> Friendship
    
    /// Accepts a received friend request by its `friendshipId`.
    ///
    /// - Parameter friendshipId: The unique identifier of the pending friend request.
    /// - Returns: The `Friendship` object with the updated status (e.g., `active`).
    func acceptFriendRequest(friendshipId: String) async throws -> Friendship
    
    /// Rejects a received friend request by its `friendshipId`.
    ///
    /// - Parameter friendshipId: The unique identifier of the pending friend request.
    /// - Returns: The updated `Friendship` object, reflecting that the request has been rejected.
    func rejectFriendRequest(friendshipId: String) async throws -> Friendship
    
    /// Cancels a sent friend request by its `friendshipId`.
    ///
    /// - Parameter friendshipId: The unique identifier of the friend request that was originally sent.
    /// - Returns: The updated `Friendship` object, reflecting that the request has been canceled.
    func cancelFriendRequest(friendshipId: String) async throws -> Friendship
    
    /// Ends an existing friendship by its `friendshipId`.
    ///
    /// - Parameter friendshipId: The unique identifier of the existing friendship to be ended.
    /// - Returns: The updated `Friendship` object, reflecting that the relationship has ended.
    func endFriendship(friendshipId: String) async throws -> Friendship
    
    // MARK: - Friendship Queries
    
    /// Fetches a specific friendship by its unique identifier.
    ///
    /// - Parameter id: The unique identifier of the friendship.
    /// - Returns: The `Friendship` object if found, otherwise `nil`.
//    func friendship(id: String) async throws -> Friendship?
    
    /// Fetches friendships for the current user, with optional pagination.
    ///
    /// - Parameters:
    ///   - limit: The maximum number of `Friendship` objects to retrieve.
    ///   - offset: The offset from where to start retrieving records.
    /// - Returns: An array of `Friendship` objects belonging to the current user.
    func myFriends(limit: Int, offset: Int) async throws -> [Friendship]
    
    /// Fetches friendships for a specific user, with optional pagination.
    ///
    /// - Parameters:
    ///   - userId: The unique identifier of the user whose friendships are to be retrieved.
    ///   - limit: The maximum number of `Friendship` objects to retrieve.
    ///   - offset: The offset from where to start retrieving records.
    /// - Returns: An array of `Friendship` objects for the specified user.
    func friends(ofUserID userId: String, limit: Int, offset: Int) async throws -> [Friendship]
    
    /// Fetches friend requests that the current user has received.
    ///
    /// - Returns: An array of `Friendship` objects representing friend requests received by the user.
    func myFriendRequests() async throws -> [Friendship]
    
    /// Fetches friend requests that the current user has sent.
    ///
    /// - Returns: An array of `Friendship` objects representing friend requests sent by the user.
    func sentFriendRequests() async throws -> [Friendship]
    
    /// Checks the friendship status between the current user and another user.
    ///
    /// - Parameter otherUserId: The unique identifier of the other user.
    /// - Returns: The `RelationshipStatus` representing the relationship state (e.g., pending, active, none).
    func friendshipStatus(otherUserId: String) async throws -> RelationshipStatus
}
