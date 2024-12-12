//
//  APIConfiguration.swift.swift
//  CourtIQAPI
//
//  Created by Pranav Suri on 2024-12-12.
//

import Foundation

public struct APIConfiguration {
    public let graphQLURL: URL
    public let defaultHeaders: [String: String]
    public let requestTimeout: TimeInterval

    public init(
        graphQLURLString: String,
        defaultHeaders: [String: String] = [:],
        requestTimeout: TimeInterval = 30.0
    ) {
        guard let url = URL(string: graphQLURLString) else {
            preconditionFailure("Invalid GraphQL endpoint URL: \(graphQLURLString)")
        }
        self.graphQLURL = url
        self.defaultHeaders = defaultHeaders
        self.requestTimeout = requestTimeout
    }

    public static func defaultConfig(graphQLURLString: String) -> APIConfiguration {
        return APIConfiguration(
            graphQLURLString: graphQLURLString,
            defaultHeaders: ["X-Client": "CourtIQAPI"],
            requestTimeout: 30.0
        )
    }
}
