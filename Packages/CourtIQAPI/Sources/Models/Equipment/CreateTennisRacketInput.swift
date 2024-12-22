//
//  CreateTennisRacketInput.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import GraphQLModels

// MARK: - Domain Model

/// A structure representing the input data required to create a new tennis racket.
///
/// `name` is required, while other fields such as `brand`, `brandId`, `model`, `modelId`, and `weight` are optional.
public struct CreateTennisRacketInput: Sendable {
    
    // MARK: - Properties
    
    /// The name or descriptive identifier for the racket.
    public let name: String
    
    /// An optional brand of the racket. Pass `nil` to leave it undefined.
    public let brand: String?
    
    /// An optional brand ID of the racket. Pass `nil` to leave it undefined.
    public let brandId: Int?
    
    /// An optional model of the racket. Pass `nil` to leave it undefined.
    public let model: String?
    
    /// An optional model ID of the racket. Pass `nil` to leave it undefined.
    public let modelId: Int?
    
    /// An optional weight of the racket in grams. Pass `nil` to leave it undefined.
    public let weight: Float?
    
    /// An optional visibility of the racket. Pass `nil` to leave it as the backend default.
    /// Visibility determines who can see this racket entry.
    public let visibility: ItemVisibility?

    // MARK: - Initialization
    
    /// Initializes a new `CreateTennisRacketInput`.
    ///
    /// - Parameters:
    ///   - name: The name or identifier for the racket.
    ///   - brand: An optional brand of the racket.
    ///   - brandId: An optional brand ID for the racket.
    ///   - model: An optional model of the racket.
    ///   - modelId: An optional model ID for the racket.
    ///   - weight: An optional weight of the racket in grams.
    ///   - visibility: An optional visibility setting for the racket.
    public init(
        name: String,
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

// MARK: - GraphQL Mapping

public extension API.CreateTennisRacketInput {
    /// Initializes a GraphQL `CreateTennisRacketInput` from a domain `CreateTennisRacketInput`.
    ///
    /// This allows converting the domain model's optional values into the GraphQL `Input` type, using `.null` where values are not provided.
    ///
    /// - Parameter domainInput: The domain `CreateTennisRacketInput` object.
    init(domainInput: CreateTennisRacketInput) {
        self.init(
            name: domainInput.name,
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
