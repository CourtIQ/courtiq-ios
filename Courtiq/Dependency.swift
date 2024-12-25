//
//  Dependency.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-21.
//

import AuthenticationService
import CourtIQAPI
import EquipmentService
import Foundation
import GraphQLModels
import UserService

// MARK: - DependencyKey

/// A protocol that defines a “key” for a specific dependency type.
public protocol DependencyKey {
    associatedtype Value
    static var currentValue: Self.Value { get set }
}

// MARK: - DependencyValues

/// A container holding all registered dependencies.
/// Each dependency is accessed or mutated via subscript.
public struct DependencyValues {
    /// Global/shared instance of the dependency container.
    nonisolated(unsafe) private static var current = DependencyValues()
    
    /// Access a dependency by its key.
    public static subscript<K>(key: K.Type) -> K.Value where K: DependencyKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }
    
    /// Access or mutate values using a writable key path.
    public static subscript<T>(_ keyPath: WritableKeyPath<DependencyValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}

// MARK: - Dependency Property Wrapper

/// Property wrapper that reads/writes a value from/to `DependencyValues`.
@propertyWrapper
public struct Dependency<T> {
    private let keyPath: WritableKeyPath<DependencyValues, T>
    
    public var wrappedValue: T {
        get { DependencyValues[keyPath] }
        set { DependencyValues[keyPath] = newValue }
    }
    
    public init(_ keyPath: WritableKeyPath<DependencyValues, T>) {
        self.keyPath = keyPath
    }
}

// MARK: - GraphQLClientKey

struct GraphQLClientKey: DependencyKey {
    nonisolated(unsafe) static var currentValue: GraphQLClient = {
        let authService = DependencyValues[\.authService]
        let apolloClient = ApolloClientProvider.createClient(
            config: APIConfiguration(graphQLURLString: "https://api-gateway.court-iq.com"),
            authService: authService
        )
        return ApolloGraphQLClient(apollo: apolloClient)
    }()
}

// MARK: - AuthServiceKey

struct AuthServiceKey: DependencyKey {
    nonisolated(unsafe) static var currentValue: AuthService = {
        AuthService(provider: FirebaseAuthProvider())
    }()
}

// MARK: - DependencyValues (AuthService)

extension DependencyValues {
    /// Accesses the shared `AuthService`.
    var authService: AuthService {
        get { Self[AuthServiceKey.self] }
        set { Self[AuthServiceKey.self] = newValue }
    }
}

// MARK: - DependencyValues (GraphQLClient)

extension DependencyValues {
    /// Accesses the shared `GraphQLClient`.
    var graphQLClient: GraphQLClient {
        get { Self[GraphQLClientKey.self] }
        set { Self[GraphQLClientKey.self] = newValue }
    }
}

// MARK: - UserServiceKey

struct UserServiceKey: DependencyKey {
    nonisolated(unsafe) static var currentValue: UserService = {
        let fallbackStore = UserStore()
        let fallbackGraphQLClient = DependencyValues[GraphQLClientKey.self]
        return UserService(
            graphQLClient: fallbackGraphQLClient,
            store: fallbackStore
        )
    }()
}

// MARK: - DependencyValues (UserService)

extension DependencyValues {
    /// Accesses the shared `UserService`.
    var userService: UserService {
        get { Self[UserServiceKey.self] }
        set { Self[UserServiceKey.self] = newValue }
    }
}

// MARK: - EquipmentServiceKey

struct EquipmentServiceKey: DependencyKey {
    nonisolated(unsafe) static var currentValue: EquipmentService {
        get {
            // Ensure a value was set; if not, this is a logic error.
            guard let service = _currentValue else {
                fatalError("EquipmentService must be set before accessing.")
            }
            return service
        }
        set {
            _currentValue = newValue
        }
    }
    
    // Stored backing variable for the EquipmentService
    nonisolated(unsafe) private static var _currentValue: EquipmentService?
}

// MARK: - DependencyValues (EquipmentService)

extension DependencyValues {
    /// Accesses the shared `EquipmentService`.
    var equipmentService: EquipmentService {
        get { Self[EquipmentServiceKey.self] }
        set { Self[EquipmentServiceKey.self] = newValue }
    }
}
