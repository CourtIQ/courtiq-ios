//
//  TennisRacket.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import GraphQLModels

// MARK: - TennisRacket

/// A model representing a tennis racket, conforming to `Equipment`.
///
/// This structure holds information about a single racket, including its identifier, owner,
/// properties such as brand, model, and weight, and references to related stringing information.
public struct TennisRacket: Equipment, Equatable {
    
    // MARK: - Properties
    
    /// A unique identifier for this racket.
    public let id: String
    
    /// The unique identifier of the owner of this racket.
    public let ownerId: String
    
    /// The display name of the racket.
    public let name: String
    
    /// The type of equipment this represents (e.g. racket, string, etc.).
    public let type: EquipmentType
    
    /// The timestamp indicating when this racket was created.
    public let createdAt: Date
    
    /// The timestamp indicating when this racket was last updated.
    public let updatedAt: Date
    
    /// The unique identifier of the currently strung string on this racket, if any.
    public let currentStringId: String?
    
    /// The brand of the racket (e.g. Wilson, Babolat, Head), if available.
    public let brand: String?
    
    /// The brand ID of the racket, if available.
    public let brandId: Int?
    
    /// The specific model of the racket, if available.
    public let model: String?
    
    /// The specific model ID of the racket, if available.
    public let modelId: Int?
    
    /// The weight of the racket in grams, if available.
    public let weight: Float?
    
    /// The visibility status of the racket to other users.
    ///
    /// Visibility determines whether the racket is public, private, or visible to specific groups.
    /// Defaults to private in the backend.
    public let visibility: ItemVisibility?
    
    // MARK: - Initialization
    
    /// Initializes a new `TennisRacket` instance.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the racket.
    ///   - ownerId: The unique identifier of the owner of this racket.
    ///   - name: The display name of the racket.
    ///   - type: The type of the equipment.
    ///   - createdAt: The creation date of the racket.
    ///   - updatedAt: The last updated date of the racket.
    ///   - currentStringId: The unique identifier of the current string on the racket, if any.
    ///   - brand: The brand of the racket, if available.
    ///   - brandId: The brand ID of the racket, if available.
    ///   - model: The model of the racket, if available.
    ///   - modelId: The model ID of the racket, if available.
    ///   - weight: The weight of the racket in grams, if available.
    ///   - visibility: The visibility status of the racket to other users, defaults to private.
    public init(
        id: String,
        ownerId: String,
        name: String,
        type: EquipmentType,
        createdAt: Date,
        updatedAt: Date,
        currentStringId: String?,
        brand: String?,
        brandId: Int?,
        model: String?,
        modelId: Int?,
        weight: Float?,
        visibility: ItemVisibility?
    ) {
        self.id = id
        self.ownerId = ownerId
        self.name = name
        self.type = type
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.currentStringId = currentStringId
        self.brand = brand
        self.brandId = brandId
        self.model = model
        self.modelId = modelId
        self.weight = weight
        self.visibility = visibility
    }
}

// MARK: - Mappers

public extension TennisRacket {
    /// Initializes a `TennisRacket` from a GraphQL `TennisRacketFields` object.
    ///
    /// - Parameter graphql: The GraphQL `TennisRacketFields` object to convert.
    init(graphql: API.TennisRacketFields) {
        self.init(
            id: graphql.id,
            ownerId: graphql.ownerId,
            name: graphql.name,
            type: EquipmentType(graphqlType: graphql.type.value ?? .tennisRacket),
            createdAt: graphql.createdAt.dateValue,
            updatedAt: graphql.updatedAt.dateValue,
            currentStringId: graphql.currentStringId,
            brand: graphql.brand,
            brandId: graphql.brandId,
            model: graphql.model,
            modelId: graphql.modelId,
            weight: graphql.weight.map { Float($0) },
            visibility: graphql.visibility.flatMap { $0.value }.map { ItemVisibility(graphqlType: $0) }
        )
    }
}
