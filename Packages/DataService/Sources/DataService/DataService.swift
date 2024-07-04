//
//  DataService.swift
//  DataService
//
//  Created by Pranav Suri on 2024-07-04.
//

import Foundation

/// A generic data service that uses a data provider to perform CRUD operations.
public class DataService: DataServiceProtocol {
    
    // MARK: - Properties
    
    private var provider: DataServiceProviderProtocol

    // MARK: - Initializer
    
    public init(provider: DataServiceProviderProtocol, collection: String) {
        self.provider = provider
        self.provider.collection = collection
    }

    // MARK: - Methods
    
    public func fetchDocument<T: Decodable>(documentID: String, completion: @escaping (Result<T, Error>) -> Void) {
        provider.fetchDocument(documentID: documentID, completion: completion)
    }

    public func updateDocument<T: Encodable>(documentID: String, document: T, completion: @escaping (Result<Void, Error>) -> Void) {
        provider.updateDocument(documentID: documentID, document: document, completion: completion)
    }

    public func deleteDocument(documentID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        provider.deleteDocument(documentID: documentID, completion: completion)
    }

    public func addDocument<T: Encodable>(document: T, completion: @escaping (Result<String, Error>) -> Void) {
        provider.addDocument(document: document, completion: completion)
    }

    public func fetchDocuments<T: Decodable>(query: [String: Any], completion: @escaping (Result<[T], Error>) -> Void) {
        provider.fetchDocuments(query: query, completion: completion)
    }
}
