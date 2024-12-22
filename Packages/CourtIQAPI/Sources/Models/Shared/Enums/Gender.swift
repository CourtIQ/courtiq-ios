//
//  Gender.swift
//  CourtIQAPI
//
//  Created by Pranav Suri on 2024-12-19.
//

import Foundation
import GraphQLModels

/// Represents the gender of a user, including associated display names and icons.
public enum Gender: String, Sendable, CaseIterable {
    case male = "MALE"
    case female = "FEMALE"
    case nonBinary = "NON_BINARY"
    case preferNotToSay = "PREFER_NOT_TO_SAY"

    // MARK: - Display Name

    /// Returns the localized display name for the gender.
    public var displayName: String {
        switch self {
        case .male:
            return NSLocalizedString("Male", comment: "Gender - Male")
        case .female:
            return NSLocalizedString("Female", comment: "Gender - Female")
        case .nonBinary:
            return NSLocalizedString("Non-Binary", comment: "Gender - Non-Binary")
        case .preferNotToSay:
            return NSLocalizedString("Prefer Not to Say", comment: "Gender - Prefer Not to Say")
        }
    }

    // MARK: - Mappers

    /// Initializes a `Gender` value from the GraphQL `API.Gender` enum.
    /// - Parameter graphqlType: The GraphQL `API.Gender` value.
    public init(graphqlType: API.Gender) {
        switch graphqlType {
        case .male: self = .male
        case .female: self = .female
        case .nonBinary: self = .nonBinary
        case .preferNotToSay: self = .preferNotToSay
        }
    }

    /// Converts a `Gender` value to its corresponding GraphQL `API.Gender` enum.
    /// - Returns: The GraphQL `API.Gender` value.
    public func toGraphQL() -> API.Gender {
        switch self {
        case .male: return .male
        case .female: return .female
        case .nonBinary: return .nonBinary
        case .preferNotToSay: return .preferNotToSay
        }
    }
}
