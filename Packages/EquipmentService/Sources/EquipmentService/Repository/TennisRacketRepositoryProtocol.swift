//
//  TennisRacketRepositoryProtocol.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Models

// MARK: - TennisRacketRepositoryProtocol
public protocol TennisRacketRepositoryProtocol: Sendable {
    
    /// Creates a new tennis racket and returns the newly created domain model.
    func create(input: CreateTennisRacketInput) async throws -> TennisRacket
    
    /// Updates an existing tennis racket and returns the updated domain model.
    func update(id: String, input: UpdateTennisRacketInput) async throws -> TennisRacket
    
    /// Deletes a tennis racket identified by `id`. Returns true if successful.
    func delete(id: String) async throws -> Bool
    
    /// Fetches a paginated list of tennis rackets.
    func fetchAll(limit: Int, offset: Int) async throws -> [TennisRacket]
    
    /// Fetches a single tennis racket by `id`, or returns `nil` if not found.
    func fetch(id: String) async throws -> TennisRacket?
    
    /// Fetches the string history for a given racket `racketId`.
    func fetchStringHistory(racketId: String) async throws -> [TennisString]
}

