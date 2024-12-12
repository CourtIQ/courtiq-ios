//
//  DefaultCacheConfiguration.swift
//  CourtIQAPI
//
//  Created by Pranav Suri on 2024-12-12.
//

import Apollo

public protocol CacheConfiguring {
    func makeStore() -> ApolloStore
}

/// A default cache configuration that uses an in-memory cache.
/// If you want to use a SQLite cache, you could introduce one here.
public struct DefaultCacheConfiguration: CacheConfiguring {
    public init() {}

    public func makeStore() -> ApolloStore {
        // By default, ApolloStore is backed by an in-memory normalized cache.
        return ApolloStore()
    }
}
