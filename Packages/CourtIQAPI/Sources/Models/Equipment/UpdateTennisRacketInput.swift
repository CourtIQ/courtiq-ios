//
//  Untitled.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import GraphQLModels

// MARK: - UpdateTennisRacketInput

/// A structure representing the input data needed to update a tennis racket's information.
///
/// Each property is optional, allowing partial updates where only certain fields need to be changed.
public struct UpdateTennisRacketInput: Sendable {
    
    // MARK: - Properties
    
    /// An optional updated name for the racket. Pass `nil` to leave unchanged.
    public let name: String?
    
    /// An optional updated brand for the racket. Pass `nil` to leave unchanged.
    public let brand: String?
    
    /// An optional updated brand ID for the racket. Pass `nil` to leave unchanged.
    public let brandId: Int?
    
    /// An optional updated model for the racket. Pass `nil` to leave unchanged.
    public let model: String?
    
    /// An optional updated model ID for the racket. Pass `nil` to leave unchanged.
    public let modelId: Int?
    
    /// An optional updated weight for the racket (in grams). Pass `nil` to leave unchanged.
    public let weight: Float?
    
    /// An optional updated visibility status for the racket.
    ///
    /// Pass `nil` to leave the visibility status unchanged.
    public let visibility: ItemVisibility?

    // MARK: - Initialization
    
    /// Initializes a new `UpdateTennisRacketInput`.
    ///
    /// - Parameters:
    ///   - name: An optional updated name for the racket.
    ///   - brand: An optional updated brand for the racket.
    ///   - brandId: An optional updated brand ID for the racket.
    ///   - model: An optional updated model for the racket.
    ///   - modelId: An optional updated model ID for the racket.
    ///   - weight: An optional updated weight for the racket (in grams).
    ///   - visibility: An optional updated visibility status for the racket.
    public init(
        name: String? = nil,
        brand: String? = nil,
        brandId: Int? = nil,
        model: String? = nil,
        modelId: Int? = nil,
        weight: Float? = nil,
        visibility: ItemVisibility? = nil
    ) {
        self.name = name
        self.brand = brand
        self.brandId = brandId
        self.model = model
        self.modelId = modelId
        self.weight = weight
        self.visibility = visibility
    }
}

// MARK: - Mappers

public extension API.UpdateTennisRacketInput {
    /// Initializes a GraphQL `UpdateTennisRacketInput` from a domain `UpdateTennisRacketInput`.
    ///
    /// Converts the domain model's optional fields into the GraphQL `Input` types, using `.null` where values are not provided.
    ///
    /// - Parameter domainInput: The domain `UpdateTennisRacketInput` instance.
    init(domainInput: UpdateTennisRacketInput) {
        self.init(
            name: domainInput.name.map { .some($0) } ?? .null,
            brand: domainInput.brand.map { .some($0) } ?? .null,
            brandId: domainInput.brandId.map { .some($0) } ?? .null,
            model: domainInput.model.map { .some($0) } ?? .null,
            modelId: domainInput.modelId.map { .some($0) } ?? .null,
            weight: domainInput.weight.map { .some(Double($0)) } ?? .null,
            visibility: domainInput.visibility.map {
                .some(GraphQLEnum($0.toGraphQL()))
            } ?? .null
        )
    }
}
