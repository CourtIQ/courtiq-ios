//
//  TennisRacketRepository.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Apollo
import CourtIQAPI
import Models

public class TennisRacketRepository: TennisRacketRepositoryProtocol {
    private let client: GraphQLClient

    public init(client: GraphQLClient) {
        self.client = client
    }

    // MARK: - Create
    public func create(input: CreateTennisRacketInput) async throws -> TennisRacket {
        let mutation = API.AddNewTennisRacketMutation(input: API.CreateTennisRacketInput(domainInput: input))
        let result = try await client.perform(mutation)
        
        
        let racketData = result.createTennisRacket
        
        let racket = racketData.fragments.tennisRacketFields.toDomain()
        return racket
    }

    // MARK: - Update
    public func update(id: String, input: UpdateTennisRacketInput) async throws -> TennisRacket {
        let mutation = API.UpdateMyTennisRacketMutation(
            updateMyTennisRacketId: API.ObjectID(id),
            input: API.UpdateTennisRacketInput(domainInput: input)
        )
        let result = try await client.perform(mutation)
        
        let racketData = result.updateMyTennisRacket
        
        let racket = racketData.fragments.tennisRacketFields.toDomain()
        return racket
    }

    // MARK: - Delete
    public func delete(id: String) async throws -> Bool {
        let mutation = API.DeleteMyTennisRacketMutation(deleteMyTennisRacketId: API.ObjectID(id))
        let result = try await client.perform(mutation)
        
        let success = result.deleteMyTennisRacket
        
        return success
    }

    // MARK: - Fetch All
    public func fetchAll(limit: Int, offset: Int) async throws -> [TennisRacket] {
        let query = API.MyTennisRacketsQuery(limit: .some(limit), offset: .some(offset))
        let result = try await client.fetch(query)
        
        let racketDataList = result.myTennisRackets
        
        // Map each returned racket to domain model
        let rackets = racketDataList.compactMap { $0.fragments.tennisRacketFields.toDomain() }
        return rackets
    }

    // MARK: - Fetch by ID
    public func fetch(id: String) async throws -> TennisRacket? {
        let query = API.MyTennisRacketQuery(id: API.ObjectID(id))
        let result = try await client.fetch(query)
        
        guard let racketData = result.myTennisRacket else {
            return nil
        }

        let racket = racketData.fragments.tennisRacketFields.toDomain()
        return racket
    }

    // MARK: - String History
    public func fetchStringHistory(racketId: String) async throws -> [TennisString] {
        let query = API.MyStringHistoryQuery(racket: API.ObjectID(racketId))
        let result = try await client.fetch(query)
        
        let stringDataList = result.myStringHistory
        
        let strings = stringDataList.map { $0.fragments.tennisStringFields.toDomain() }
        return strings
    }
}
