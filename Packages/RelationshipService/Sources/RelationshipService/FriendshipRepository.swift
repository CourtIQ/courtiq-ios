//
//  FriendshipRepository.swift
//  SocialService
//
//  Created by Pranav on 2024-12-22.
//

import Foundation
import GraphQLModels
import Models
import CourtIQAPI

public final class FriendshipRepository: FriendshipRepositoryProtocol {
    
    private let client: GraphQLClient

    // MARK: - Initialization
    public init(client: GraphQLClient) {
        self.client = client
    }

    // MARK: - Friend Request Lifecycle

    public func sendFriendRequest(to receiverId: String) async throws -> Models.Friendship {
        let mutation = API.SendFriendRequestMutation(receiverId: receiverId)
        
        do {
            let data = try await client.perform(mutation)
            let gqlFriendship = data.sendFriendRequest.fragments.friendshipFields
            return Models.Friendship(graphql: gqlFriendship)
        } catch {
            throw error
        }
    }
    
    public func acceptFriendRequest(friendshipId: String) async throws -> Models.Friendship {
        let mutation = API.AcceptFriendRequestMutation(friendshipId: friendshipId)
        
        do {
            let data = try await client.perform(mutation)
            let gqlFriendship = data.acceptFriendRequest.fragments.friendshipFields
            return Models.Friendship(graphql: gqlFriendship)
        } catch {
            throw error
        }
    }
    
    public func rejectFriendRequest(friendshipId: String) async throws -> Models.Friendship {
        let mutation = API.RejectFriendRequestMutation(friendshipId: friendshipId)
        
        do {
            let data = try await client.perform(mutation)
            let gqlFriendship = data.rejectFriendRequest.fragments.friendshipFields
            return Models.Friendship(graphql: gqlFriendship)
        } catch {
            throw error
        }
    }
    
    public func cancelFriendRequest(friendshipId: String) async throws -> Models.Friendship {
        let mutation = API.CancelFriendRequestMutation(friendshipId: friendshipId)
        
        do {
            let data = try await client.perform(mutation)
            let gqlFriendship = data.cancelFriendRequest.fragments.friendshipFields
            return Models.Friendship(graphql: gqlFriendship)
        } catch {
            throw error
        }
    }
    
    public func endFriendship(friendshipId: String) async throws -> Models.Friendship {
        let mutation = API.EndFriendshipMutation(friendshipId: friendshipId)
        
        do {
            let data = try await client.perform(mutation)
            let gqlFriendship = data.endFriendship.fragments.friendshipFields
            return Models.Friendship(graphql: gqlFriendship)
        } catch {
            throw error
        }
    }
    
    // MARK: - Friendship Queries

//    public func friendship(id: String) async throws -> Models.Friendship? {
//        let query = API.FriendshipQuery(id: id)
//        
//        do {
//            let data = try await client.fetch(query)
//            // If your schema returns an optional Friendship in the query, handle that:
//            guard let gqlFriendship = data.friendship?.fragments.friendshipFields else {
//                return nil // Not found, or data.friendship is nil
//            }
//            return Models.Friendship(graphql: gqlFriendship)
//        } catch {
//            throw error
//        }
//    }
    
    public func myFriends(limit: Int, offset: Int) async throws -> [Models.Friendship] {
        let query = API.MyFriendsQuery(limit: limit, offset: offset)
        
        do {
            let data = try await client.fetch(query)
            // Suppose data.myFriends is a list of FriendshipFields
            // Adjust based on your actual schema:
            let gqlFriendships = data.myFriends.map { $0.fragments.friendshipFields }
            return gqlFriendships.map { Models.Friendship(graphql: $0) }
        } catch {
            throw error
        }
    }
    
    public func friends(ofUserID userId: String, limit: Int, offset: Int) async throws -> [Models.Friendship] {
        let query = API.FriendsQuery(userId: userId, limit: limit, offset: offset)
        
        do {
            let data = try await client.fetch(query)
            let gqlFriendships = data.friends.map { $0.fragments.friendshipFields }
            return gqlFriendships.map { Models.Friendship(graphql: $0) }
        } catch {
            throw error
        }
    }
    
    public func myFriendRequests() async throws -> [Models.Friendship] {
        let query = API.MyFriendRequestsQuery()
        
        do {
            let data = try await client.fetch(query)
            // Suppose data.myFriendRequests is [FriendshipFields]
            let gqlFriendships = data.myFriendRequests.map { $0.fragments.friendshipFields }
            return gqlFriendships.map { Models.Friendship(graphql: $0) }
        } catch {
            throw error
        }
    }
    
    public func sentFriendRequests() async throws -> [Models.Friendship] {
        let query = API.SentFriendRequestsQuery()
        
        do {
            let data = try await client.fetch(query)
            let gqlFriendships = data.sentFriendRequests.map { $0.fragments.friendshipFields }
            return gqlFriendships.map { Models.Friendship(graphql: $0) }
        } catch {
            throw error
        }
    }
    
    public func friendshipStatus(otherUserId: String) async throws -> Models.RelationshipStatus {
        let query = API.FriendshipStatusQuery(otherUserId: otherUserId)
        
        do {
            let data = try await client.fetch(query)
            // Suppose data.friendshipStatus is of type GraphQLEnum<API.RelationshipStatus>
            guard let statusValue = data.friendshipStatus.value else {
                // If no value, default to .none or throw
                return .none
            }
            return Models.RelationshipStatus(graphqlType: statusValue)
        } catch {
            throw error
        }
    }
    
    // MARK: - Unused Default Init
    public init() {
        fatalError("init() has not been implemented. Use init(client:) instead.")
    }
}
