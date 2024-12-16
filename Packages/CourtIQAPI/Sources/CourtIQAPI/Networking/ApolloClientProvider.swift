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
        authService: any AuthServiceProtocol,
        cacheConfiguration: CacheConfiguring = DefaultCacheConfiguration()
    ) -> ApolloClient {
        let store = ApolloStore()

        class CustomInterceptorProvider: DefaultInterceptorProvider {
            let authService: any AuthServiceProtocol

            init(
                client: URLSessionClient = URLSessionClient(),
                shouldInvalidateClientOnDeinit: Bool = true,
                store: ApolloStore,
                authService: any AuthServiceProtocol
            ) {
                self.authService = authService
                super.init(client: client,
                           shouldInvalidateClientOnDeinit: shouldInvalidateClientOnDeinit,
                           store: store)
            }

            override func interceptors<Operation: GraphQLOperation>(
                for operation: Operation
            ) -> [any ApolloInterceptor] {
                // Base interceptors
                var interceptors = super.interceptors(for: operation)
                
                // Insert custom interceptors at the start
                interceptors.insert(AuthInterceptor(authService: authService), at: 0)
                interceptors.insert(NetworkLoggerInterceptor(), at: 1)
                interceptors.insert(ErrorInterceptor(), at: 2)

                return interceptors
            }
        }

        let provider = CustomInterceptorProvider(
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

