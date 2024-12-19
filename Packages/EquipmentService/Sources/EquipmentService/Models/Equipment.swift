//
//  Equipment.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation

// MARK: - Equipment

/// A protocol defining the basic requirements for any piece of equipment.
///
/// This protocol ensures that all equipment types share common properties
/// such as identifiers, ownership information, naming, type classification,
/// and timestamps for creation and updates.
public protocol Equipment: Identifiable, Sendable {
    /// A unique identifier for this equipment piece.
    var id: String { get }
    /// The unique identifier of the owner of this equipment.
    var ownerId: String { get }
    /// The display name of the equipment.
    var name: String { get }
    /// The categorized type of this equipment (e.g., racket, string, etc.).
    var type: EquipmentType { get }
    /// The timestamp indicating when this equipment was created.
    var createdAt: Date { get }
    /// The timestamp indicating when this equipment was last updated.
    var updatedAt: Date { get }
}
