//
//  Untitled.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

// MARK: - UpdateTennisRacketInput

/// A structure representing the input data needed to update a tennis racket's information.
///
/// Each property is optional, allowing partial updates where only certain fields need to be changed.
public struct UpdateTennisRacketInput {
    
    // MARK: - Properties
    
    /// An optional updated name for the racket. Pass `nil` to leave unchanged.
    public let name: String?
    
    /// An optional updated brand for the racket. Pass `nil` to leave unchanged.
    public let brand: String?
    
    /// An optional updated brand id for the racket. Pass  `nil` to leave unchanged.
    public let brandId: Int?
    
    /// An optional updated model for the racket. Pass `nil` to leave unchanged.
    public let model: String?
    
    /// An optional updated model id for the racket. Pass  `nil` to leave unchanged.
    public let modelId: Int?
    
    /// An optional updated weight for the racket (in grams). Pass `nil` to leave unchanged.
    public let weight: Float?

    // MARK: - Initialization
    
    /// Initializes a new `UpdateTennisRacketInput`.
    ///
    /// - Parameters:
    ///   - name: An optional updated name for the racket.
    ///   - brand: An optional updated brand for the racket.
    ///   - model: An optional updated model for the racket.
    ///   - weight: An optional updated weight for the racket (in grams).
    public init(
        name: String? = nil,
        brand: String? = nil,
        brandId: Int? = nil,
        model: String? = nil,
        modelId: Int? = nil,
        weight: Float? = nil
    ) {
        self.name = name
        self.brand = brand
        self.brandId = brandId
        self.model = model
        self.modelId = modelId
        self.weight = weight
    }
}
