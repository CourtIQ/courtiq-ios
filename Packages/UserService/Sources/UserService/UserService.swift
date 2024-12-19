//
//  UserService.swift
//
//
//  Created by Pranav Suri on 07/04/2024.
//

import Foundation
import Models
import CourtIQAPI

@MainActor
public final class UserService: @preconcurrency UserServiceProtocol {
    
    @Published public private(set) var currentUser: User?
    
    private let graphQLClient: GraphQLClient
    
    /// Initializes the user service with a given GraphQL client.
    /// - Parameter graphQLClient: A `GraphQLClient` to make GraphQL requests.
    public init(graphQLClient: GraphQLClient) {
        self.graphQLClient = graphQLClient
    }

    public func fetchCurrentUser() async throws {
        let query = API.MeQuery()
        let data = try await graphQLClient.fetch(query)
        
        guard let fetchedUser = data.me else {
            throw NSError(domain: "UserService", code: -1, userInfo: [NSLocalizedDescriptionKey: "No user returned from server"])
        }
        
        // If userFields is non-optional, no need for guard
        let userFields = fetchedUser.fragments.userFields
        self.currentUser = User(from: userFields)
        print(currentUser)
    }
    
    public func completeRegistration(_ registrationInfo: CompleteRegistrationUser) async throws {
        let input = registrationInfo.asInput
        try await updateUser(input)
    }

    public func updateUser(_ userInfo: API.UpdateUserInput) async throws {
        let input = userInfo

        let mutation = API.CompleteUserRegistrationMutation(input: input)
        let mutationData = try await graphQLClient.perform(mutation)

        guard let updatedUser = mutationData.updateUser else {
            throw NSError(domain: "UserService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to update user"])
        }
        self.currentUser = User(from: updatedUser.fragments.userFields)
        print(currentUser)
    }

    public func isUsernameAvailable(_ username: String) async throws -> Bool {
        let query = API.IsUsernameAvailableQuery(username: username)
        let data = try await graphQLClient.fetch(query)
        return data.isUsernameAvailable
    }
}
