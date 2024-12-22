//
//  EquipmentServiceImpl.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Models
import CourtIQAPI

public final actor EquipmentService: EquipmentServiceProtocol {
    
    // MARK: - Dependencies
    private let racketRepo: TennisRacketRepositoryProtocol
    private let stringRepo: TennisStringRepositoryProtocol
    public let store: any EquipmentStoreProtocol
    private let graphQLClient: GraphQLClient

    public init(graphQLClient: GraphQLClient,
                store: EquipmentStore) {
        self.graphQLClient = graphQLClient
        self.racketRepo = TennisRacketRepository(client: graphQLClient)
        self.stringRepo = TennisStringRepository(client: graphQLClient)
        self.store = store
    }
    
    private func loadInitialData() async {
        do {
            let rackets = try await getMyTennisRackets(limit: 20, offset: 0)
            let strings = try await getMyTennisStrings(limit: 20, offset: 0)

            await store.updateTennisRackets(rackets)
            await store.updateTennisStrings(strings)

            print("Successfully loaded initial data: \(rackets.count) rackets.")
            print("Successfully loaded initial data: \(strings.count) rackets.")
        } catch {
            print("Failed to load initial data: \(error.localizedDescription)")
        }
    }
    
    public func createTennisRacket(input: CreateTennisRacketInput) async throws {
        let racket = try await racketRepo.create(input: input)
        await store.addTennisRacket(racket)
    }

    public func updateMyTennisRacket(id: String, input: UpdateTennisRacketInput) async throws {
        let racket = try await racketRepo.update(id: id, input: input)
        await store.addTennisRacket(racket)
    }
    
    public func deleteMyTennisRacket(id: String) async throws -> Bool {
        if try await racketRepo.delete(id: id) {
            await store.removeTennisRacket(id)
            return true
        }
        return false
    }
    
    public func getMyTennisRackets(limit: Int, offset: Int) async throws -> [TennisRacket] {
        return try await racketRepo.fetchAll(limit: limit, offset: offset)
    }
    
    public func getMyTennisRacket(id: String) async throws -> TennisRacket? {
        return try await racketRepo.fetch(id: id)
    }
    
    public func getMyStringHistory(forRacketID: String) async throws -> [TennisString] {
        return try await racketRepo.fetchStringHistory(racketId: forRacketID)
    }
    
    // MARK: - String Operations
    
    public func createTennisString(input: CreateTennisStringInput) async throws -> TennisString {
        return try await stringRepo.create(input: input)
    }
    
    public func updateMyTennisString(id: String, input: UpdateTennisStringInput) async throws -> TennisString {
        return try await stringRepo.update(id: id, input: input)
    }
    
    public func deleteMyTennisString(id: String) async throws -> Bool {
        return try await stringRepo.delete(id: id)
    }
    
    public func getMyTennisStrings(limit: Int, offset: Int) async throws -> [TennisString] {
        return try await stringRepo.fetchAll(limit: limit, offset: offset)
    }
    
    public func getMyTennisString(id: String) async throws -> TennisString? {
        return try await stringRepo.fetch(id: id)
    }
    
    // MARK: - Combined Operations
    
    public func assignRacketToString(racketId: String, stringId: String) async throws -> TennisString {
        return try await stringRepo.assignRacketToString(racketId: racketId, stringId: stringId)
    }
}
