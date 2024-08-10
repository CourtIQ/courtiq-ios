//
//  RelationshipServiceProtocol.swift
//
//
//  Created by Pranav Suri on 2024-08-04.
//

import Foundation

/// Protocol that defines the operations for a friendship service.
@available(iOS 14.0, *)
public protocol RelationshipServiceProtocol: ObservableObject {

    /// Sends a friend request from one user to another.
    /// - Parameters:
    ///   - from: The ID of the user sending the friend request.
    ///   - to: The ID of the user receiving the friend request.
    func sendFriendRequest(from: String, to: String) async throws
    
    /// Accepts a friend request from one user to another.
    /// - Parameters:
    ///   - currentUserId: The ID of the user accepting the friend request.
    ///   - friendUserId: The ID of the user whose friend request is being accepted.
    func acceptFriendRequest(request: RelationRequest) async throws
    
    /// Fetches the list of friends for a user.
    /// - Parameters:
    ///   - userId: The ID of the user whose friends are being fetched.
    /// - Returns: An array of `Relationship` objects.
    func fetchFriends(userId: String) async throws -> [Relation]
    
    /// Finds mutual friends between two users.
    /// - Parameters:
    ///   - userId1: The ID of the first user.
    ///   - userId2: The ID of the second user.
    /// - Returns: An array of mutual friend `Relationship` objects.
    func fetchMutualFriends(userId1: String, userId2: String) async throws -> [Relation]
    
    /// Removes a friend from a user's friend list.
    /// - Parameters:
    ///   - currentUserId: The ID of the user removing the friend.
    ///   - friendUserId: The ID of the friend being removed.
    func removeFriend(currentUserId: String, friendUserId: String) async throws
}
