//
//  UserRepository.swift
//  UserService
//
//  Created by Pranav Suri on 2024-12-20.
//

import CourtIQAPI
import Foundation
import Models
import GraphQLModels

public final class UserRepository: UserRepositoryProtocol {

    
    private let graphQLClient: GraphQLClient

    public init(graphQLClient: GraphQLClient) {
        self.graphQLClient = graphQLClient
    }

    public func fetchCurrentUser() async throws -> User? {
        let query = API.MeQuery()
        let response = try await graphQLClient.fetch(query)
        
        guard let user = response.me?.fragments.userFields else {
            return nil
        }

        return User(graphql: user)
    }
    
    public func fetchUser(by id: String) async throws -> User? {
        throw NSError(domain: "UserRepository", code: -1, userInfo: [NSLocalizedDescriptionKey: "fetchUser(by:) not implemented"])
    }
    
    public func updateUser(_ user: User) async throws -> User {
        throw NSError(domain: "UserRepository", code: -1, userInfo: [NSLocalizedDescriptionKey: "updateUser(_:) not implemented"])
    }
    
    public func completeUserRegistration(_ registrationInfo: UpdateUserInput) async throws -> Models.User {
        let mutation = API.CompleteUserRegistrationMutation(input: API.UpdateUserInput(domainInput: registrationInfo))
        let response = try await graphQLClient.perform(mutation)
        
        guard let user = response.updateUser?.fragments.userFields else {
            throw NSError(domain: "UserRepository", code: -1, userInfo: [NSLocalizedDescriptionKey: "completeUserRegistration(_:) failed"])
        }
        
        return User(graphql: user)
    }
}
