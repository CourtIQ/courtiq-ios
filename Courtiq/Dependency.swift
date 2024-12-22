//
//  EnvironmentKeys.swift
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

public protocol DependencyKey {
    associatedtype Value
    static var currentValue: Self.Value { get set }
}

public struct DependencyValues {
    nonisolated(unsafe) private static var current = DependencyValues()
    
    public static subscript<K>(key: K.Type) -> K.Value where K: DependencyKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }
    
    public static subscript<T>(_ keyPath: WritableKeyPath<DependencyValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}

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

struct GraphQLClientKey: DependencyKey {
    nonisolated(unsafe) static var currentValue: GraphQLClient = {
        // Initialize ApolloClient with your specific configuration
        let authService = DependencyValues[\.authService]
        let apolloClient = ApolloClientProvider.createClient(
            config: APIConfiguration(graphQLURLString: "http://localhost:3000"),
            authService: authService
        )
        return ApolloGraphQLClient(apollo: apolloClient)
    }()
}

struct AuthServiceKey: DependencyKey {
    nonisolated(unsafe) static var currentValue: AuthService = {
        AuthService(provider: FirebaseAuthProvider())
    }()
}

extension DependencyValues {
    var authService: AuthService {
        get { DependencyValues[AuthServiceKey.self] }
        set { DependencyValues[AuthServiceKey.self] = newValue }
    }
}

extension DependencyValues {
    var graphQLClient: GraphQLClient {
        get { DependencyValues[GraphQLClientKey.self] }
        set { DependencyValues[GraphQLClientKey.self] = newValue }
    }
}

struct UserServiceKey: DependencyKey {
    nonisolated(unsafe) static var currentValue: UserService = {
        let fallbackStore = UserStore()
        let fallbackGraphQLClient = DependencyValues[GraphQLClientKey.self]
        
        return UserService(graphQLClient: fallbackGraphQLClient, store: fallbackStore)
    }()
}

extension DependencyValues {
    var userService: UserService {
        get { DependencyValues[UserServiceKey.self] }
        set { DependencyValues[UserServiceKey.self] = newValue }
    }
}

struct EquipmentServiceKey: DependencyKey {
    nonisolated(unsafe) static var currentValue: EquipmentService {
        get {
            // This ensures we have a value set before accessing
            guard let service = _currentValue else {
                fatalError("EquipmentService must be set before accessing")
            }
            return service
        }
        set {
            _currentValue = newValue
        }
    }
    
    nonisolated(unsafe) private static var _currentValue: EquipmentService?
}

extension DependencyValues {
    var equipmentService: EquipmentService {
        get { DependencyValues[EquipmentServiceKey.self] }
        set { DependencyValues[EquipmentServiceKey.self] = newValue }
    }
}
