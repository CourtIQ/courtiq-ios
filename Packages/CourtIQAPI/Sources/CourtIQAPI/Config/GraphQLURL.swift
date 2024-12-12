//
//  File.swift
//  CourtIQAPI
//
//  Created by Pranav Suri on 2024-12-12.
//

import Foundation

public struct GraphQLURL {
    public let url: URL

    public init(urlString: String) {
        guard let url = URL(string: urlString) else {
            preconditionFailure("Invalid GraphQL endpoint URL: \(urlString)")
        }
        self.url = url
    }
}
