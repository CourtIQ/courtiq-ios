//
//  FriendshipService.swift
//
//
//  Created by Pranav Suri on 08/04/2024.
//

import DataService
import SwiftUI

@available(iOS 14.0, *)
public class FriendshipService: FriendshipServiceProtocol{
    
    private var collectionPath: 
    public func sendFriendRequest(from: String, to: String) async throws {
        <#code#>
    }
    
    public func acceptFriendRequest(currentUserId: String, friendUserId: String) async throws {
        <#code#>
    }
    
    public func fetchFriends(userId: String) async throws -> [Relationship] {
        <#code#>
    }
    
    public func fetchMutualFriends(userId1: String, userId2: String) async throws -> [Relationship] {
        <#code#>
    }
    
    public func removeFriend(currentUserId: String, friendUserId: String) async throws {
        <#code#>
    }
    
    
}
