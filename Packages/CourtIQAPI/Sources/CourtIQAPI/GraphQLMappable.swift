//
//  GraphQLMappable.swift
//  CourtIQAPI
//
//  Created by Pranav Suri on 2024-12-15.
//

import Foundation

public protocol GraphQLMappable {
    associatedtype GraphQLModel
    init(from gqlModel: GraphQLModel)
}
