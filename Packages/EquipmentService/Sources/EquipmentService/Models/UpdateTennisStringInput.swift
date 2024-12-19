//
//  Untitled.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation

// MARK: - UpdateTennisStringInput

/// A structure representing the input data needed to update a tennis string entry.
///
/// All fields are optional, making it possible to update only specific aspects of the string information.
public struct UpdateTennisStringInput {
    
    // MARK: - Properties
    
    /// An optional updated name for the string entry. Pass `nil` to leave unchanged.
    public let name: String?
    
    /// An optional updated brand for the string. Pass `nil` to leave unchanged.
    public let brand: String?
    
    /// An optional updated brand id for the string. Pass  `nil` to leave unchanged.
    public let brandId: Int?
    
    /// An optional updated model for the string. Pass `nil` to leave unchanged.
    public let model: String?
    
    /// An optional updated model id for the string. Pass  `nil` to leave unchanged.
    public let modelId: Int?

    /// An optional updated tension detail (mains/crosses) for the string. Pass `nil` to leave unchanged.
    public let tension: StringTension?
    
    /// An optional updated stringing date for when the string was installed. Pass `nil` to leave unchanged.
    public let stringingDate: Date?
    
    /// An optional updated burst date for when the string wore out or broke. Pass `nil` to leave unchanged.
    public let burstDate: Date?

    // MARK: - Initialization
    
    /// Initializes a new `UpdateTennisStringInput`.
    ///
    /// - Parameters:
    ///   - name: An optional updated name for the string entry.
    ///   - brand: An optional updated brand for the string.
    ///   - model: An optional updated model for the string.
    ///   - tension: An optional updated tension details for the string's mains and crosses.
    ///   - stringingDate: An optional updated date indicating when the string was installed.
    ///   - burstDate: An optional updated date indicating when the string burst.
    public init(
        name: String? = nil,
        brand: String? = nil,
        brandId: Int? = nil,
        model: String? = nil,
        modelId: Int? = nil,
        tension: StringTension? = nil,
        stringingDate: Date? = nil,
        burstDate: Date? = nil
    ) {
        self.name = name
        self.brand = brand
        self.brandId = brandId
        self.model = model
        self.modelId = modelId
        self.tension = tension
        self.stringingDate = stringingDate
        self.burstDate = burstDate
    }
}
