//
//  AuthUser.swift
//  AuthenticationService
//
//  Created by Pranav Suri on 2024-12-13.
//

// MARK: - AuthUser Protocol

/// A protocol representing an authenticated user identified by a mongoId.
public protocol AuthUser {
    var id: String { get }
}

/// A concrete implementation of AuthUser that uses mongoId as its identifier.
public struct MongoUser: AuthUser {
    public let id: String
    
    public init(id: String) {
        self.id = id
    }
}
