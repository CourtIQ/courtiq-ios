//
//  NetworkLoggerInterceptor.swift
//  CourtIQAPI
//
//  Created by Pranav Suri on 2024-12-12.
//

import Apollo
import ApolloAPI
import Foundation

final class NetworkLoggerInterceptor: ApolloInterceptor {
    let id: String = "NetworkLogger"
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: any RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, any Error>) -> Void
    ) {
        // Log the outgoing request
        print("🚀 [NetworkLogger] Requesting \(Operation.operationName)")
        print("URL: \(request.graphQLEndpoint.absoluteString)")
        print("Operation: \(request.operation)")

        chain.proceedAsync(
            request: request,
            response: response,
            interceptor: self,
            completion: { result in
                // Log the response
                switch result {
                case .success(let graphQLResult):
                    if let errors = graphQLResult.errors {
                        print("⚠️ [NetworkLogger] Response for \(Operation.operationName) had errors: \(errors)")
                    } else {
                        print("✅ [NetworkLogger] Response for \(Operation.operationName) succeeded")
                    }
                case .failure(let error):
                    print("❌ [NetworkLogger] Error for \(Operation.operationName): \(error)")
                }
                completion(result)
            }
        )
    }
}
