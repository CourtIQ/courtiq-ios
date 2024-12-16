import Apollo
import ApolloAPI
import Foundation

public protocol GraphQLClient {
    func fetch<Query: GraphQLQuery>(_ query: Query) async throws -> Query.Data
    func perform<Mutation: GraphQLMutation>(_ mutation: Mutation) async throws -> Mutation.Data
}

public final class ApolloGraphQLClient: GraphQLClient {
    private let apollo: ApolloClient

    public init(apollo: ApolloClient) {  // Changed parameter type
        self.apollo = apollo
    }

    public func fetch<Query: GraphQLQuery>(_ query: Query) async throws -> Query.Data {
        try await withCheckedThrowingContinuation { continuation in
            apollo.fetch(query: query) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data {
                        continuation.resume(returning: data)
                    } else if let errors = graphQLResult.errors {
                        continuation.resume(throwing: ApolloClientError.graphQLErrors(errors))
                    } else {
                        continuation.resume(throwing: ApolloClientError.noData)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    public func perform<Mutation: GraphQLMutation>(_ mutation: Mutation) async throws -> Mutation.Data {
        try await withCheckedThrowingContinuation { continuation in
            apollo.perform(mutation: mutation) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data {
                        continuation.resume(returning: data)
                    } else if let errors = graphQLResult.errors {
                        continuation.resume(throwing: ApolloClientError.graphQLErrors(errors))
                    } else {
                        continuation.resume(throwing: ApolloClientError.noData)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

public enum ApolloClientError: Error {
    case noData
    case graphQLErrors([GraphQLError])
}
