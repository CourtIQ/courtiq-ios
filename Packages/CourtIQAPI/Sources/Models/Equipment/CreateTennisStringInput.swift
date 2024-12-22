//
//  CreateTennisStringInput.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import GraphQLModels

// MARK: - Domain Model

/// A structure representing the input data required to create a new tennis string entry.
///
/// Mandatory fields include `name`, while all other fields are optional.
/// This provides flexibility in specifying only the necessary details.
public struct CreateTennisStringInput: Sendable {
    
    // MARK: - Properties
    
    /// The name or identifier of the string setup.
    public let name: String
    
    /// An optional brand of the string.
    public let brand: String?
    
    /// An optional brand ID of the string.
    public let brandId: Int?
    
    /// An optional model of the string.
    public let model: String?
    
    /// An optional model ID of the string.
    public let modelId: Int?
    
    /// An optional tension detail (mains/crosses) for the string.
    public let tension: StringTension?
    
    /// An optional date indicating when the string was installed.
    public let stringingDate: Date?
    
    /// An optional date indicating when the string burst or wore out.
    public let burstDate: Date?
    
    /// An optional visibility of the string setup.
    /// By default, visibility is private in the backend if not provided.
    public let visibility: ItemVisibility?

    // MARK: - Initialization
    
    /// Initializes a new `CreateTennisStringInput`.
    ///
    /// - Parameters:
    ///   - name: The name or descriptive identifier for the string setup.
    ///   - brand: An optional brand of the string.
    ///   - brandId: An optional brand ID of the string.
    ///   - model: An optional model of the string.
    ///   - modelId: An optional model ID of the string.
    ///   - tension: Optional tension details for the string's mains and crosses.
    ///   - stringingDate: An optional date when the string was installed.
    ///   - burstDate: An optional date when the string wore out or broke.
    ///   - visibility: An optional visibility of the string setup to other users.
    public init(
        name: String,
        brand: String? = nil,
        brandId: Int? = nil,
        model: String? = nil,
        modelId: Int? = nil,
        tension: StringTension? = nil,
        stringingDate: Date? = nil,
        burstDate: Date? = nil,
        visibility: ItemVisibility? = nil
    ) {
        self.name = name
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

// MARK: - GraphQL Mapping

public extension API.CreateTennisStringInput {
    /// Initializes a GraphQL `CreateTennisStringInput` from a domain `CreateTennisStringInput`.
    ///
    /// Converts the domain model's optional fields into GraphQL `Input` types, using `.null` where values are not provided.
    ///
    /// - Parameter domainInput: The domain `CreateTennisStringInput` instance.
    init(domainInput: CreateTennisStringInput) {
        self.init(
            name: domainInput.name,
            brand: domainInput.brand.map { .some($0) } ?? .null,
            brandId: domainInput.brandId.map { .some($0) } ?? .null,
            model: domainInput.model.map { .some($0) } ?? .null,
            modelId: domainInput.modelId.map { .some($0) } ?? .null,
            tension: domainInput.tension.map { .some(API.StringTensionInput(domainInput: $0)) } ?? .null,
            stringingDate: .from(domainInput.stringingDate),
            burstDate: .from(domainInput.burstDate),
            visibility: domainInput.visibility.map {
                .some(GraphQLEnum($0.toGraphQL()))
            } ?? .null
        )
    }
}
