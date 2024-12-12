//
//  ApolloClientProvider.swift
//  CourtIQAPI
//
//  Created by Pranav Suri on 2024-12-12.
//

import Apollo
import ApolloAPI
import Foundation
import AuthenticationService

public struct ApolloClientProvider {
    public static func createClient(
        config: APIConfiguration,
        authService: any AuthServiceProtocol
    ) -> ApolloClient {
        let store = ApolloStore()
        
        // Create a custom interceptor provider that inherits from DefaultInterceptorProvider
        class CustomInterceptorProvider: DefaultInterceptorProvider {
            let authService: any AuthServiceProtocol
            
            init(client: URLSessionClient = URLSessionClient(),
                 shouldInvalidateClientOnDeinit: Bool = true,
                 store: ApolloStore,
                 authService: any AuthServiceProtocol) {
                self.authService = authService
                super.init(client: client,
                          shouldInvalidateClientOnDeinit: shouldInvalidateClientOnDeinit,
                          store: store)
            }
            
            override func interceptors<Operation: GraphQLOperation>(
                for operation: Operation
            ) -> [any ApolloInterceptor] {
                var interceptors = super.interceptors(for: operation)
                // Add custom interceptors at the beginning of the chain
                interceptors.insert(AuthInterceptor(authService: authService), at: 0)
                interceptors.insert(NetworkLoggerInterceptor(), at: 1)
                return interceptors
            }
        }
        
        let provider = CustomInterceptorProvider(
            client: URLSessionClient(),
            store: store,
            authService: authService
        )

        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: config.graphQLURL
        )

        return ApolloClient(networkTransport: networkTransport, store: store)
    }
}
