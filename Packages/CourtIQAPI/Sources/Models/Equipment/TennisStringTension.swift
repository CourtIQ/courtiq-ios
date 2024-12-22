//
//  StringTension.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import GraphQLModels

// MARK: - StringTension

/// A structure representing the tension at which the mains and crosses of the racket were strung.
public struct StringTension: Equatable, Sendable {
    
    // MARK: - Properties
    
    /// The tension (in lbs or kg) of the mains, if available.
    public let mains: Int?
    
    /// The tension (in lbs or kg) of the crosses, if available.
    public let crosses: Int?

    // MARK: - Initialization
    
    /// Initializes a new `StringTension` instance.
    ///
    /// - Parameters:
    ///   - mains: The tension for the mains, if available.
    ///   - crosses: The tension for the crosses, if available.
    public init(mains: Int?, crosses: Int?) {
        self.mains = mains
        self.crosses = crosses
    }
}

// MARK: - Mappers

public extension StringTension {
    /// Initializes a `StringTension` from a GraphQL `TennisStringFields.Tension` object.
    ///
    /// - Parameter graphql: The GraphQL `TennisStringFields.Tension` object.
    init(graphql: API.TennisStringFields.Tension) {
        self.init(
            mains: graphql.mains,
            crosses: graphql.crosses
        )
    }
}
