//
//  ItemVisibility.swift
//  CourtIQAPI
//
//  Created by Pranav Suri on 2024-12-19.
//

import Foundation
import GraphQLModels

public enum ItemVisibility: String, Sendable {
    case `public` = "PUBLIC"
    case `private` = "PRIVATE"
    case friends = "FRIENDS"
    case coaches = "COACHES"
    
    // MARK: - Display Name
    
    /// Returns the localized display name for the item visibility setting.
    public var displayName: String {
        switch self {
        case .public:
            return NSLocalizedString("Public", comment: "Item Visibility - Public")
        case .private:
            return NSLocalizedString("Private", comment: "Item Visibility - Private")
        case .friends:
            return NSLocalizedString("Friends Only", comment: "Item Visibility - Friends")
        case .coaches:
            return NSLocalizedString("Coaches Only", comment: "Item Visibility - Coaches")
        }
    }
    
    // MARK: - Mappers
    
    /// Initializes an `ItemVisibility` value from the GraphQL `API.ItemVisibility` enum.
    /// - Parameter graphqlType: The GraphQL `API.ItemVisibility` value.
    public init(graphqlType: API.Visibility) {
        switch graphqlType {
        case .public:
            self = .public
        case .private:
            self = .private
        case .friends:
            self = .friends
        case .coaches:
            self = .coaches
        }
    }
    
    /// Converts an `ItemVisibility` value to its corresponding GraphQL `API.ItemVisibility` enum.
    /// - Returns: The GraphQL `API.ItemVisibility` value.
    public func toGraphQL() -> API.Visibility {
        switch self {
        case .public:
            return .public
        case .private:
            return .private
        case .friends:
            return .friends
        case .coaches:
            return .coaches
        }
    }
}
