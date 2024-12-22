//
//  Untitled.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import GraphQLModels

// MARK: - UpdateTennisStringInput

/// A structure representing the input data needed to update a tennis string entry.
///
/// All fields are optional, making it possible to update only specific aspects of the string information.
public struct UpdateTennisStringInput: Sendable {
    
    // MARK: - Properties
    
    /// An optional updated name for the string entry. Pass `nil` to leave unchanged.
    public let name: String?
    
    /// An optional updated brand for the string. Pass `nil` to leave unchanged.
    public let brand: String?
    
    /// An optional updated brand id for the string. Pass `nil` to leave unchanged.
    public let brandId: Int?
    
    /// An optional updated model for the string. Pass `nil` to leave unchanged.
    public let model: String?
    
    /// An optional updated model id for the string. Pass `nil` to leave unchanged.
    public let modelId: Int?

    /// An optional updated tension detail (mains/crosses) for the string. Pass `nil` to leave unchanged.
    public let tension: StringTension?
    
    /// An optional updated stringing date for when the string was installed. Pass `nil` to leave unchanged.
    public let stringingDate: Date?
    
    /// An optional updated burst date for when the string wore out or broke. Pass `nil` to leave unchanged.
    public let burstDate: Date?
    
    /// An optional updated visibility status for the string entry. Pass `nil` to leave unchanged.
    ///
    /// Visibility determines whether the string entry is public, private, or visible to specific groups.
    public let visibility: ItemVisibility?

    // MARK: - Initialization
    
    /// Initializes a new `UpdateTennisStringInput`.
    ///
    /// - Parameters:
    ///   - name: An optional updated name for the string entry.
    ///   - brand: An optional updated brand for the string.
    ///   - brandId: An optional updated brand ID for the string.
    ///   - model: An optional updated model for the string.
    ///   - modelId: An optional updated model ID for the string.
    ///   - tension: An optional updated tension details for the string's mains and crosses.
    ///   - stringingDate: An optional updated date indicating when the string was installed.
    ///   - burstDate: An optional updated date indicating when the string burst.
    ///   - visibility: An optional updated visibility status for the string entry.
    public init(
        name: String? = nil,
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

// MARK: - Mappers

public extension API.UpdateTennisStringInput {
    /// Initializes a GraphQL `UpdateTennisStringInput` from a domain `UpdateTennisStringInput`.
    ///
    /// Converts the domain model's optional fields into the GraphQL `Input` types, using `.null` where values are not provided.
    ///
    /// - Parameter domainInput: The domain `UpdateTennisStringInput` instance.
    init(domainInput: UpdateTennisStringInput) {
        self.init(
            name: domainInput.name.map { .some($0) } ?? .null,
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

// MARK: - StringTensionInput Mapper

public extension API.StringTensionInput {
    /// Initializes a GraphQL `StringTensionInput` from a domain `StringTension`.
    ///
    /// Converts the optional integer values into GraphQL nullable integers, using `.null` where values are not provided.
    ///
    /// - Parameter domainTension: The domain `StringTension` instance.
    init(domainInput: StringTension) {
        self.init(
            mains: domainInput.mains.map { .some($0) } ?? .null,
            crosses: domainInput.crosses.map { .some($0) } ?? .null
        )
    }
}
