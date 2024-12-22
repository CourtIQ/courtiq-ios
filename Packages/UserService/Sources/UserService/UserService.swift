//
//  UserService.swift
//
//
//  Created by Pranav Suri on 07/04/2024.
//

import Foundation
import Models
import GraphQLModels
import CourtIQAPI

public final actor UserService: UserServiceProtocol {
        
    // MARK: - Private Properties

    private let graphQLClient: GraphQLClient
    private let userRepo: UserRepository // or UserRepositoryProtocol, if you prefer a protocol

    // MARK: - Public Store

    /// The user store holding the current user's state.
    private let store: any UserStoreProtocol

    // MARK: - Initializer

    /// Initializes the `UserService` with a GraphQL client and a user store.
    /// - Parameters:
    ///   - graphQLClient: The GraphQL client to perform network requests.
    ///   - store: A store to maintain and update the current user state.
    public init(
        graphQLClient: GraphQLClient,
        store: any UserStoreProtocol
    ) {
        self.graphQLClient = graphQLClient
        self.userRepo = UserRepository(graphQLClient: graphQLClient)
        self.store = store
    }

    // MARK: - Methods

    public func fetchCurrentUser() async throws {
        print(#function)
        let user = try await userRepo.fetchCurrentUser()
        if let user = user {
            await store.updateCurrentUser(user)
        }
    }
    
    public func completeRegistration(_ registrationInfo: UpdateUserInput) async throws {
        let user = try await userRepo.completeUserRegistration(registrationInfo)
        await store.updateCurrentUser(user)
    }

    public func updateUser(_ userInfo: UpdateUserInput) async throws {
        // example usage:
        // let updatedUser = try await userRepo.updateUser(someUser)
        // await store.updateCurrentUser(updatedUser)
        print(#function)
    }

    public func isUsernameAvailable(_ username: String) async throws -> Bool {
        print(#function)
        return true
    }
}
