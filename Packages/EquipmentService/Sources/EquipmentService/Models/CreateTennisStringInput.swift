//
//  CreateTennisStringInput.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation

// MARK: - CreateTennisStringInput

/// A structure representing the input data required to create a new tennis string entry.
///
/// Mandatory fields include the `name`, while all other fields are optional
/// to provide flexibility in specifying only the necessary details.
public struct CreateTennisStringInput {
    
    // MARK: - Properties
    
    /// The name or identifier of the string setup.
    public let name: String
    
    /// An optional brand of the string, if available.
    public let brand: String?
    
    /// An optional brand id of the strinf, if available.
    public let brandId: Int?
    
    /// An optional model of the string, if available.
    public let model: String?
    
    /// An optional model id of the string, if available
    public let modelId: Int?
    
    /// An optional tension detail (mains/crosses) for the string.
    public let tension: StringTension?
    
    /// An optional date indicating when the string was installed.
    public let stringingDate: Date?
    
    /// An optional date indicating when the string burst or wore out.
    public let burstDate: Date?

    // MARK: - Initialization
    
    /// Initializes a new `CreateTennisStringInput`.
    ///
    /// - Parameters:
    ///   - name: The name or descriptive identifier for the string setup.
    ///   - brand: An optional brand of the string.
    ///   - model: An optional model of the string.
    ///   - tension: Optional tension details for the string's mains and crosses.
    ///   - stringingDate: An optional date when the string was installed.
    ///   - burstDate: An optional date when the string wore out or broke.
    public init(
        name: String,
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
