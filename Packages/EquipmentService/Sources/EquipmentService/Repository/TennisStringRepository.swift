//
//  TennisStringRepository.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Apollo
import CourtIQAPI
import GraphQLModels
import Models

public final class TennisStringRepository: TennisStringRepositoryProtocol {
    private let client: GraphQLClient

    public init(client: GraphQLClient) {
        self.client = client
    }

    // MARK: - Create
    public func create(input: CreateTennisStringInput) async throws -> TennisString {
        let mutation = API.AddNewTennisStringMutation(input: API.CreateTennisStringInput(domainInput: input))
        let result = try await client.perform(mutation)

        let stringData = result.createTennisString

        return TennisString(graphql: stringData.fragments.tennisStringFields)
    }

    // MARK: - Update
    public func update(id: String, input: UpdateTennisStringInput) async throws -> TennisString {
        let mutation = API.UpdateMyTennisStringMutation(
            updateMyTennisStringId: API.ObjectID(id),
            input: API.UpdateTennisStringInput(domainInput: input)
        )
        let result = try await client.perform(mutation)

        let stringData = result.updateMyTennisString

        return TennisString(graphql: stringData.fragments.tennisStringFields)
    }

    // MARK: - Delete
    public func delete(id: String) async throws -> Bool {
        let mutation = API.DeleteMyTennisStringMutation(deleteMyTennisStringId: API.ObjectID(id))
        let result = try await client.perform(mutation)

        let success = result.deleteMyTennisString
        return success
    }

    // MARK: - Fetch All
    public func fetchAll(limit: Int, offset: Int) async throws -> [TennisString] {
        let query = API.MyTennisStringsQuery(limit: .some(limit), offset: .some(offset))
        let result = try await client.fetch(query)
        
        let strings = result.me?.myTennisStrings.compactMap {
            TennisString(graphql: $0.fragments.tennisStringFields)
        }
        if let strings {
            return strings
        } else {
            return []
        }
    }

    // MARK: - Fetch by ID
    public func fetch(id: String) async throws -> TennisString? {
        let query = API.MyTennisStringQuery(id: API.ObjectID(id))
        let result = try await client.fetch(query)

        guard let stringData = result.myTennisString else {
            throw RepositoryError.missingData(id)
        }
        return TennisString(graphql: stringData.fragments.tennisStringFields)
    }

    // MARK: - Assign Racket to String
    public func assignRacketToString(racketId: String, stringId: String) async throws -> TennisString {
        let mutation = API.AssignRacketToStringMutation(racketId: API.ObjectID(racketId), stringId: API.ObjectID(stringId))
        let result = try await client.perform(mutation)

        let updatedString = result.assignRacketToString

        return TennisString(graphql: updatedString.fragments.tennisStringFields)
    }
}

// MARK: - RepositoryError
enum RepositoryError: Error {
    case missingData(String)
}
