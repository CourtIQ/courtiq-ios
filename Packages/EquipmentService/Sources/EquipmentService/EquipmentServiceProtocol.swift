//
//  EquipmentServiceProtocol.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Models

public protocol EquipmentServiceProtocol {
    
    var store: any EquipmentStoreProtocol { get }

    // MARK: - Racket Operations
    
    /// Creates a new tennis racket.
    ///
    /// - Parameter input: The details needed to create a new tennis racket.
    /// - Returns: The newly created tennis racket.
    func createTennisRacket(input: CreateTennisRacketInput) async throws
    
    /// Updates an existing tennis racket.
    ///
    /// - Parameters:
    ///   - id: The unique identifier of the tennis racket to update.
    ///   - input: The updated fields for the tennis racket.
    /// - Returns: The updated tennis racket.
    func updateMyTennisRacket(id: String, input: UpdateTennisRacketInput) async throws
    
    /// Deletes a tennis racket by its unique identifier.
    ///
    /// - Parameter id: The unique identifier of the tennis racket to delete.
    /// - Returns: `true` if the racket was successfully deleted, otherwise `false`.
    func deleteMyTennisRacket(id: String) async throws -> Bool
    
    /// Fetches a paginated list of tennis rackets.
    ///
    /// - Parameters:
    ///   - limit: The maximum number of rackets to fetch.
    ///   - offset: The offset from which to start fetching rackets.
    /// - Returns: An array of tennis rackets.
    func getMyTennisRackets(limit: Int, offset: Int) async throws -> [TennisRacket]
    
    /// Fetches a single tennis racket by its unique identifier.
    ///
    /// - Parameter id: The unique identifier of the tennis racket.
    /// - Returns: The tennis racket if found, otherwise `nil`.
    func getMyTennisRacket(id: String) async throws -> TennisRacket?
    
    /// Fetches the string history for a given tennis racket.
    ///
    /// - Parameter forRacketID: The unique identifier of the tennis racket whose string history is to be fetched.
    /// - Returns: An array of tennis string entries associated with the racket.
    func getMyStringHistory(forRacketID: String) async throws -> [TennisString]

    // MARK: - String Operations
    
    /// Creates a new tennis string entry.
    ///
    /// - Parameter input: The details needed to create a new tennis string entry.
    /// - Returns: The newly created tennis string entry.
    func createTennisString(input: CreateTennisStringInput) async throws -> TennisString
    
    /// Updates an existing tennis string entry.
    ///
    /// - Parameters:
    ///   - id: The unique identifier of the tennis string entry to update.
    ///   - input: The updated fields for the tennis string entry.
    /// - Returns: The updated tennis string entry.
    func updateMyTennisString(id: String, input: UpdateTennisStringInput) async throws -> TennisString
    
    /// Deletes a tennis string entry by its unique identifier.
    ///
    /// - Parameter id: The unique identifier of the tennis string entry to delete.
    /// - Returns: `true` if the string was successfully deleted, otherwise `false`.
    func deleteMyTennisString(id: String) async throws -> Bool
    
    /// Fetches a paginated list of tennis string entries.
    ///
    /// - Parameters:
    ///   - limit: The maximum number of strings to fetch.
    ///   - offset: The offset from which to start fetching strings.
    /// - Returns: An array of tennis string entries.
    func getMyTennisStrings(limit: Int, offset: Int) async throws -> [TennisString]
    
    /// Fetches a single tennis string entry by its unique identifier.
    ///
    /// - Parameter id: The unique identifier of the tennis string entry.
    /// - Returns: The tennis string entry if found, otherwise `nil`.
    func getMyTennisString(id: String) async throws -> TennisString?

    // MARK: - Combined Operations
    
    /// Fetches a paginated list of all equipment (both rackets and strings).
    ///
    /// - Parameters:
    ///   - limit: The maximum number of equipment items to fetch.
    ///   - offset: The offset from which to start fetching equipment items.
    /// - Returns: An array of equipment items (either rackets or strings).
//    func getMyEquipment(limit: Int, offset: Int) async throws -> [Equipment]
    
    /// Assigns a tennis racket to a tennis string.
    ///
    /// - Parameters:
    ///   - racketId: The unique identifier of the racket.
    ///   - stringId: The unique identifier of the string.
    /// - Returns: The updated tennis string entry after assignment.
    func assignRacketToString(racketId: String, stringId: String) async throws -> TennisString
}
