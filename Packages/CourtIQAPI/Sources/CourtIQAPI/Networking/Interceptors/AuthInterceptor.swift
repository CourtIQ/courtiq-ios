//
//  AuthInterceptor.swift
//  CourtIQAPI
//
//  Created by Pranav Suri on 2024-12-12.
//

import Apollo
import ApolloAPI
import Foundation
import AuthenticationService

final class AuthInterceptor: ApolloInterceptor {
    var id: String {
        return "AuthInterceptor"
    }

    private let authService: any AuthServiceProtocol

    init(authService: any AuthServiceProtocol) {
        self.authService = authService
    }

    func interceptAsync<Operation: GraphQLOperation>(
        chain: any RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, any Error>) -> Void
    ) {
        // Because getIDToken is async and throwing, we use a Task to call it and handle errors
        Task {
            do {
                // Try to get the token
                let token = try await authService.getIDToken()
                
                // If we get here, token retrieval succeeded
                request.addHeader(name: "Authorization", value: "Bearer \(token)")
            } catch {
                // Handle token retrieval failure
                // You could choose to handle this differently, e.g., log error or abort request.
                // For now, we'll just proceed without the token.
                print("❌ Failed to retrieve ID token: \(error)")
            }

            // Proceed with the chain regardless of whether we got a token or not
            chain.proceedAsync(
                request: request,
                response: response,
                interceptor: self,
                completion: completion
            )
        }
    }
}
