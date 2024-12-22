//
//  UserStore.swift
//  UserService
//
//  Created by Pranav Suri on 2024-12-20.
//

import Foundation
import Models
import SwiftUI

/// A protocol defining the functionality of a user store.
@MainActor
public protocol UserStoreProtocol: ObservableObject, Sendable {
    // MARK: - Properties
    
    /// The currently logged-in user.
    /// - Note: This property can be `nil` if no user is logged in.
    var currentUser: User? { get }
    
    // MARK: - Methods
    
    /// Updates the store with new user information.
    ///
    /// - Parameter user: A `User` object containing updated user information.
    func updateCurrentUser(_ user: User)
}
