//
//  EquipmentStoreProtocol.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-18.
//

import Foundation
import Models

// MARK: - EquipmentStoreProtocol

/// A protocol defining the functionality of a user equipment store.
@MainActor
public protocol EquipmentStoreProtocol: ObservableObject, Sendable {
    // MARK: - Properties
    
    /// The user's collection of tennis rackets.
    var myTennisRackets: [TennisRacket] { get }
    
    /// The user's collection of tennis strings.
    var myTennisStrings: [TennisString] { get }
    
    // MARK: - Racket Operations
    
    /// Adds a tennis racket to the user's collection.
    ///
    /// - Parameter tennisRacket: The tennis racket to add.
    func addTennisRacket(_ tennisRacket: TennisRacket)
    
    /// Removes a tennis racket from the user's collection by ID.
    ///
    /// - Parameter id: The unique identifier of the tennis racket to remove.
    func removeTennisRacket(_ id: String)
    
    /// Updates an existing tennis racket in the user's collection.
    ///
    /// - Parameter tennisRacket: The tennis racket with updated details.
    func updateTennisRacket(_ tennisRacket: TennisRacket)
    
    /// Updates the user's collection of tennis rackets.
    ///
    /// - Parameter tennisRackets: The new array of tennis rackets.
    func updateTennisRackets(_ tennisRackets: [TennisRacket])
    
    // MARK: - String Operations
    
    /// Adds a tennis string to the user's collection.
    ///
    /// - Parameter tennisString: The tennis string to add.
    func addTennisString(_ tennisString: TennisString)
    
    /// Removes a tennis string from the user's collection by ID.
    ///
    /// - Parameter id: The unique identifier of the tennis string to remove.
    func removeTennisStrings(_ id: String)
    
    /// Updates an existing tennis string in the user's collection.
    ///
    /// - Parameter tennisString: The tennis string with updated details.
    func updateTennisString(_ tennisString: TennisString)
    
    /// Updates the user's collection of tennis strings.
    ///
    /// - Parameter tennisStrings: The new array of tennis strings.
    func updateTennisStrings(_ tennisStrings: [TennisString])
    
    /// Adds multiple tennis strings to the user's collection.
    ///
    /// - Parameter tennisStrings: The array of tennis strings to add.
    func addTennisStrings(_ tennisStrings: [TennisString])
}
