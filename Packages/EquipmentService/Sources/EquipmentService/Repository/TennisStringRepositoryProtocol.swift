//
//  TennisStringRepositoryProtocol.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Models

// MARK: - TennisStringRepositoryProtocol
public protocol TennisStringRepositoryProtocol: Sendable {
    /// Creates a new tennis string entry and returns the newly created domain model.
    func create(input: CreateTennisStringInput) async throws -> TennisString
    
    /// Updates an existing tennis string entry and returns the updated domain model.
    func update(id: String, input: UpdateTennisStringInput) async throws -> TennisString
    
    /// Deletes a tennis string entry identified by `id`. Returns true if successful.
    func delete(id: String) async throws -> Bool
    
    /// Fetches a paginated list of tennis strings.
    func fetchAll(limit: Int, offset: Int) async throws -> [TennisString]
    
    /// Fetches a single tennis string entry by `id`, or returns `nil` if not found.
    func fetch(id: String) async throws -> TennisString?
    
    /// Assigns a racket to a string. Returns the updated tennis string entry.
    func assignRacketToString(racketId: String, stringId: String) async throws -> TennisString
}
