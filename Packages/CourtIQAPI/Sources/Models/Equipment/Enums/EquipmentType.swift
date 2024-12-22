//
//  EquipmentType.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import GraphQLModels

// MARK: - EquipmentType

/// An enumeration representing the different types of equipment.
/// This can help differentiate between various categories, such as rackets and strings.
public enum EquipmentType: String, Sendable {
    /// Represents a tennis racket.
    case tennisRacket = "TENNIS_RACKET"
    /// Represents a tennis string.
    case tennisString = "TENNIS_STRING"
    
    // MARK: - Display Name

    /// Returns the localized display name for the equipment type.
    public var displayName: String {
        switch self {
        case .tennisRacket:
            return NSLocalizedString("Tennis Racket", comment: "EquipmentType - Tennis Racket")
        case .tennisString:
            return NSLocalizedString("Tennis String", comment: "EquipmentType - Tennis String")
        }
    }
    
    // MARK: - Mappers
    
    /// Initializes an `EquipmentType` value from the GraphQL `API.EquipmentType` enum.
    /// - Parameter graphqlType: The GraphQL `API.EquipmentType` value.
    public init(graphqlType: API.EquipmentType) {
        switch graphqlType {
        case .tennisRacket:
            self = .tennisRacket
        case .tennisString:
            self = .tennisString
        }
    }
    
    /// Converts an `EquipmentType` value to its corresponding GraphQL `API.EquipmentType` enum.
    /// - Returns: The GraphQL `API.EquipmentType` value.
    public func toGraphQL() -> API.EquipmentType {
        switch self {
        case .tennisRacket:
            return .tennisRacket
        case .tennisString:
            return .tennisString
        }
    }
}
