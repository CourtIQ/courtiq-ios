//
//  EquipmentType.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation

// MARK: - EquipmentType

/// An enumeration representing the different types of equipment.
/// This can help differentiate between various categories, such as rackets and strings.
public enum EquipmentType: String, Sendable {
    /// Represents a tennis racket.
    case tennisRacket = "TENNIS_RACKET"
    /// Represents a tennis string.
    case tennisString = "TENNIS_STRING"
}
