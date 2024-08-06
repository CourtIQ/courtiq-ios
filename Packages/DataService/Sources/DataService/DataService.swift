//
//  DataService.swift
//  DataService
//
//  Created by Pranav Suri on 2024-07-04.
//

import Foundation

// MARK: - DataService

/// A generic data service that uses a data provider to perform CRUD operations.
public class DataService: DataServiceProtocol {
    
    // MARK: - Properties
    
    /// The data provider used by the service for CRUD operations.
    private var provider: DataServiceProviderProtocol

    // MARK: - Initializer
    
    /// Initializes the DataService with a specific data provider.
    /// - Parameter provider: The data provider to use for data operations.
    public init(provider: DataServiceProviderProtocol) {
        self.provider = provider
    }

    // MARK: - Document Operations
    
    /// Fetches a document from a collection by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the fetch.
    public func fetchDocument<T: Codable>(documentID: String, completion: @escaping (Result<T, Error>) -> Void) {
        provider.fetchDocument(documentID: documentID, completion: completion)
    }
    
    /// Fetches a document from a custom collection by document ID.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the fetch.
    public func fetchDocument<T: Codable>(collectionPath: String, documentID: String, completion: @escaping (Result<T, Error>) -> Void) {
        provider.fetchDocument(collectionPath: collectionPath, documentID: documentID, completion: completion)
    }

    /// Updates a document in a collection by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - document: The document to be updated.
    ///   - completion: The completion handler with the result of the update.
    public func updateDocument<T: Codable>(documentID: String, document: T, completion: @escaping (Result<Void, Error>) -> Void) {
        provider.updateDocument(documentID: documentID, document: document, completion: completion)
    }
    
    /// Updates a document in a custom collection by document ID.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - documentID: The document ID.
    ///   - document: The document to be updated.
    ///   - completion: The completion handler with the result of the update.
    public func updateDocument<T: Codable>(collectionPath: String, documentID: String, document: T, completion: @escaping (Result<Void, Error>) -> Void) {
        provider.updateDocument(collectionPath: collectionPath, documentID: documentID, document: document, completion: completion)
    }

    /// Deletes a document from a collection by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the deletion.
    public func deleteDocument(documentID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        provider.deleteDocument(documentID: documentID, completion: completion)
    }
    
    /// Deletes a document from a custom collection by document ID.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the deletion.
    public func deleteDocument(collectionPath: String, documentID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        provider.deleteDocument(collectionPath: collectionPath, documentID: documentID, completion: completion)
    }

    /// Adds a document to a collection.
    /// - Parameters:
    ///   - document: The document to be added.
    ///   - completion: The completion handler with the result of the addition.
    public func addDocument<T: Codable>(document: T, completion: @escaping (Result<String, Error>) -> Void) {
        provider.addDocument(document: document, completion: completion)
    }
    
    /// Adds a document to a custom collection.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - document: The document to be added.
    ///   - completion: The completion handler with the result of the addition.
    public func addDocument<T: Codable>(collectionPath: String, document: T, completion: @escaping (Result<String, Error>) -> Void) {
        provider.addDocument(collectionPath: collectionPath, document: document, completion: completion)
    }

    // MARK: - Query Operations
    
    /// Fetches documents from a collection based on query constraints.
    /// - Parameters:
    ///   - constraints: The query constraints to apply. If nil, fetches all documents.
    ///   - completion: The completion handler with the result of the fetch.
    public func fetchDocuments<T: Codable>(constraints: [QueryConstraint]?, completion: @escaping (Result<[T], Error>) -> Void) {
        provider.fetchDocuments(constraints: constraints ?? [], completion: completion)
    }
    
    /// Fetches documents from a custom collection based on query constraints.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - constraints: The query constraints to apply. If nil, fetches all documents.
    ///   - completion: The completion handler with the result of the fetch.
    public func fetchDocuments<T: Codable>(collectionPath: String, constraints: [QueryConstraint]?, completion: @escaping (Result<[T], Error>) -> Void) {
        provider.fetchDocuments(collectionPath: collectionPath, constraints: constraints ?? [], completion: completion)
    }

    /// Gets the count of documents in a collection based on query constraints.
    /// - Parameters:
    ///   - constraints: The query constraints to apply. If nil, counts all documents.
    ///   - completion: The completion handler with the result of the count.
    public func countDocuments(constraints: [QueryConstraint]?, completion: @escaping (Result<Int, Error>) -> Void) {
        provider.countDocuments(constraints: constraints ?? [], completion: completion)
    }
    
    /// Gets the count of documents in a custom collection based on query constraints.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - constraints: The query constraints to apply. If nil, counts all documents.
    ///   - completion: The completion handler with the result of the count.
    public func countDocuments(collectionPath: String, constraints: [QueryConstraint]?, completion: @escaping (Result<Int, Error>) -> Void) {
        provider.countDocuments(collectionPath: collectionPath, constraints: constraints ?? [], completion: completion)
    }
}
