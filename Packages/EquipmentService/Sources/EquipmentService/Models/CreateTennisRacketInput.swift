//
//  Untitled.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

// MARK: - CreateTennisRacketInput

/// A structure representing the input data required to create a new tennis racket.
///
/// `name` is required, while other fields such as `brand`, `model`, and `weight` are optional.
public struct CreateTennisRacketInput {
    
    // MARK: - Properties
    
    /// The name or descriptive identifier for the racket.
    public let name: String
    
    /// An optional brand of the racket.
    public let brand: String?
    
    /// An optional brand of the racket.
    public let brandId: Int?
    
    /// An optional model of the racket.
    public let model: String?
    
    /// An optional brand of the racket.
    public let modelId: Int?
    
    /// An optional weight of the racket in grams.
    public let weight: Float?

    // MARK: - Initialization
    
    /// Initializes a new `CreateTennisRacketInput`.
    ///
    /// - Parameters:
    ///   - name: The name or identifier for the racket.
    ///   - brand: An optional brand of the racket.
    ///   - model: An optional model of the racket.
    ///   - weight: An optional weight of the racket in grams.
    public init(
        name: String,
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
