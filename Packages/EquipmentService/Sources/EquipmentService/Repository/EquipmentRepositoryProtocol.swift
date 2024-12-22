//
//  EquipmentRepositoryProtocol.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-17.
//

import Foundation
import Models

// MARK: - TennisStringRepositoryProtocol
public protocol EquipmentRepositoryProtocol {
    /// Creates a new tennis string entry and returns the newly created domain model.
    func create(input: CreateTennisStringInput) async throws -> TennisString
}
