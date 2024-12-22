//
//  TennisString.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import GraphQLModels

// MARK: - TennisString

/// A model representing a single entry of tennis strings used with a racket.
/// This encompasses both the racket and string information, as well as timing details
/// such as stringing and burst dates.
public struct TennisString: Equipment, Equatable {
    
    // MARK: - Properties
    
    /// A unique identifier for this string entry.
    public let id: String
    
    /// The unique identifier of the owner of this string entry.
    public let ownerId: String
    
    /// The name or identifier of this string entry, typically referencing the string model or setup.
    public let name: String
    
    /// The type of equipment this represents (e.g., string, racket, etc.).
    public let type: EquipmentType
    
    /// The timestamp indicating when this string entry was created.
    public let createdAt: Date
    
    /// The timestamp indicating when this string entry was last updated.
    public let updatedAt: Date
    
    /// The unique identifier of the racket this string entry is associated with, if any.
    public let racket: String?
    
    /// The brand of the string, if available.
    public let brand: String?
    
    /// The specific brand id of the string, if available.
    public let brandId: Int?
    
    /// The specific model of the string, if available.
    public let model: String?
    
    /// The specific model id of the string, if available.
    public let modelId: Int?
    
    /// The tension details for the mains and crosses of the strings, if available.
    public let tension: StringTension?
    
    /// The date on which the strings were strung into the racket, if available.
    public let stringingDate: Date?
    
    /// The date on which the strings burst or wore out, if available.
    public let burstDate: Date?
    
    /// The visibility status of the string entry to other users.
    ///
    /// Visibility determines whether the string entry is public, private, or visible to specific groups.
    /// Defaults to private in the backend.
    public let visibility: ItemVisibility?

    // MARK: - Initialization
    
    /// Initializes a new `TennisString` instance.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the string entry.
    ///   - ownerId: The unique identifier of the owner of this entry.
    ///   - name: The name or descriptive identifier of this string setup.
    ///   - type: The type of equipment this represents.
    ///   - createdAt: The creation date of this entry.
    ///   - updatedAt: The date this entry was last updated.
    ///   - racket: The unique identifier of the associated racket, if any.
    ///   - brand: The brand of the string, if available.
    ///   - brandId: The brand ID of the string, if available.
    ///   - model: The model of the string, if available.
    ///   - modelId: The model ID of the string, if available.
    ///   - tension: The tension details (mains/crosses), if available.
    ///   - stringingDate: The date the racket was strung, if available.
    ///   - burstDate: The date the string burst or wore out, if available.
    ///   - visibility: The visibility status of the string entry, defaults to private if not set.
    public init(
        id: String,
        ownerId: String,
        name: String,
        type: EquipmentType,
        createdAt: Date,
        updatedAt: Date,
        racket: String?,
        brand: String?,
        brandId: Int?,
        model: String?,
        modelId: Int?,
        tension: StringTension?,
        stringingDate: Date?,
        burstDate: Date?,
        visibility: ItemVisibility? = nil
    ) {
        self.id = id
        self.ownerId = ownerId
        self.name = name
        self.type = type
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.racket = racket
        self.brand = brand
        self.brandId = brandId
        self.model = model
        self.modelId = modelId
        self.tension = tension
        self.stringingDate = stringingDate
        self.burstDate = burstDate
        self.visibility = visibility
    }
}

// MARK: - Mappers

public extension TennisString {
    /// Initializes a `TennisString` from a GraphQL `TennisStringFields` object.
    ///
    /// - Parameter graphql: The GraphQL `TennisStringFields` object to convert.
    init(graphql: API.TennisStringFields) {
        self.init(
            id: graphql.id,
            ownerId: graphql.ownerId,
            name: graphql.name,
            type: EquipmentType(graphqlType: graphql.type.value ?? .tennisString),
            createdAt: graphql.createdAt.dateValue,
            updatedAt: graphql.updatedAt.dateValue,
            racket: graphql.racket,
            brand: graphql.brand,
            brandId: graphql.brandId,
            model: graphql.model,
            modelId: graphql.modelId,
            tension: graphql.tension.map { StringTension(graphql: $0) },
            stringingDate: graphql.stringingDate?.dateValue,
            burstDate: graphql.burstDate?.dateValue,
            visibility: graphql.visibility.flatMap { $0.value }.map { ItemVisibility(graphqlType: $0) }
        )
    }
}
