//
//  UserEquipmentStore.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-18.
//

import Foundation
import Models

// MARK: - UserEquipmentStore

/// A class managing the user's equipment, including tennis rackets and strings.
public class EquipmentStore: EquipmentStoreProtocol {
    // MARK: - Properties
    
    @Published public private(set) var myTennisRackets: [TennisRacket] = []
    @Published public private(set) var myTennisStrings: [TennisString] = []

    // MARK: - Initialization
    
    public init() {}

    // MARK: - Racket Operations
    
    public func addTennisRacket(_ tennisRacket: TennisRacket) {
        if !myTennisRackets.contains(where: { $0.id == tennisRacket.id }) {
            myTennisRackets.insert(tennisRacket, at: 0)
        }
    }
    
    public func removeTennisRacket(_ id: String) {
        if let index = myTennisRackets.firstIndex(where: { $0.id == id }) {
            myTennisRackets.remove(at: index)
        }
    }
    
    public func updateTennisRacket(_ tennisRacket: TennisRacket) {
        if let index = myTennisRackets.firstIndex(where: { $0.id == tennisRacket.id }) {
            myTennisRackets[index] = tennisRacket
        }
    }
    
    public func updateTennisRackets(_ tennisRackets: [TennisRacket]) {
        myTennisRackets = tennisRackets
    }
    
    // MARK: - String Operations
    
    public func addTennisString(_ tennisString: TennisString) {
        if !myTennisStrings.contains(where: { $0.id == tennisString.id }) {
            myTennisStrings.insert(tennisString, at: 0)
        }
    }
    
    public func addTennisStrings(_ tennisStrings: [TennisString]) {
        myTennisStrings = tennisStrings
    }
    
    public func removeTennisStrings(_ id: String) {
        if let index = myTennisStrings.firstIndex(where: { $0.id == id }) {
            myTennisStrings.remove(at: index)
        }
    }
    
    public func updateTennisString(_ tennisString: TennisString) {
        if let index = myTennisStrings.firstIndex(where: { $0.id == tennisString.id }) {
            myTennisStrings[index] = tennisString
        }
    }
    
    public func updateTennisStrings(_ tennisStrings: [TennisString]) {
        myTennisStrings = tennisStrings
    }
    
}
