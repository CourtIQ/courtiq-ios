//
//  ErrorInterceptor.swift
//  CourtIQAPI
//
//  Created by Pranav Suri on 2024-12-12.
//

import Apollo
import ApolloAPI
import Foundation

final class ErrorInterceptor: ApolloInterceptor {
    var id: String { "ErrorInterceptor" }

    func interceptAsync<Operation>(
        chain: any RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, any Error>) -> Void
    ) where Operation: GraphQLOperation {
        
        chain.proceedAsync(request: request, response: response, interceptor: self) { result in
            switch result {
            case .success(let graphQLResult):
                // Check for GraphQL errors
                if let errors = graphQLResult.errors, !errors.isEmpty {
                    // Handle them, maybe transform into a custom error type
                    let customError = NSError(domain: "GraphQLErrorDomain", code: -1, userInfo: [
                        NSLocalizedDescriptionKey: errors.map { $0.localizedDescription }.joined(separator: ", ")
                    ])
                    completion(.failure(customError))
                } else {
                    completion(.success(graphQLResult))
                }
            case .failure(let error):
                // Handle network or other lower-level errors
                let nsError = error as NSError
                // Transform or log error if needed
                completion(.failure(nsError))
            }
        }
    }
}
