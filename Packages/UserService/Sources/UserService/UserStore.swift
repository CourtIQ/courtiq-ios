//
//  UserStore.swift
//  UserService
//
//  Created by Pranav Suri on 2024-12-20.
//

import Foundation
import Models

@MainActor
public final class UserStore: UserStoreProtocol {
    
    @Published public private(set) var currentUser: User?

    public init(currentUser: User? = nil) {
        self.currentUser = currentUser
    }

    public func updateCurrentUser(_ user: User) {
        self.currentUser = user
    }
}
