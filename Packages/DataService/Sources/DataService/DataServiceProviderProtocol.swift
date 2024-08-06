//
//  DataServiceProviderProtocol.swift
//  DataService
//
//  Created by Pranav Suri on 2024-07-04.
//

import Foundation

// MARK: - DataServiceProviderProtocol

/// Protocol that defines the operations a data service provider must implement.
public protocol DataServiceProviderProtocol {
    
    // MARK: - Properties
    
    /// The default collection path used by the provider.
    var collectionPath: String { get set }
    
    // MARK: - Document Operations
    
    /// Fetches a document from a collection by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the fetch.
    func fetchDocument<T: Codable>(documentID: String, completion: @escaping (Result<T, Error>) -> Void)
    
    /// Fetches a document from a custom collection by document ID.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the fetch.
    func fetchDocument<T: Codable>(collectionPath: String, documentID: String, completion: @escaping (Result<T, Error>) -> Void)
    
    /// Updates a document in a collection by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - document: The document to be updated.
    ///   - completion: The completion handler with the result of the update.
    func updateDocument<T: Codable>(documentID: String, document: T, completion: @escaping (Result<Void, Error>) -> Void)
    
    /// Updates a document in a custom collection by document ID.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - documentID: The document ID.
    ///   - document: The document to be updated.
    ///   - completion: The completion handler with the result of the update.
    func updateDocument<T: Codable>(collectionPath: String, documentID: String, document: T, completion: @escaping (Result<Void, Error>) -> Void)
    
    /// Deletes a document from a collection by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the deletion.
    func deleteDocument(documentID: String, completion: @escaping (Result<Void, Error>) -> Void)
    
    /// Deletes a document from a custom collection by document ID.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the deletion.
    func deleteDocument(collectionPath: String, documentID: String, completion: @escaping (Result<Void, Error>) -> Void)
    
    /// Adds a document to a collection.
    /// - Parameters:
    ///   - document: The document to be added.
    ///   - completion: The completion handler with the result of the addition.
    func addDocument<T: Codable>(document: T, completion: @escaping (Result<String, Error>) -> Void)
    
    /// Adds a document to a custom collection.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - document: The document to be added.
    ///   - completion: The completion handler with the result of the addition.
    func addDocument<T: Codable>(collectionPath: String, document: T, completion: @escaping (Result<String, Error>) -> Void)
    
    // MARK: - Query Operations
    
    /// Fetches documents from a collection based on query constraints.
    /// - Parameters:
    ///   - constraints: The query constraints to apply.
    ///   - completion: The completion handler with the result of the fetch.
    func fetchDocuments<T: Codable>(constraints: [QueryConstraint], completion: @escaping (Result<[T], Error>) -> Void)
    
    /// Fetches documents from a custom collection based on query constraints.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - constraints: The query constraints to apply.
    ///   - completion: The completion handler with the result of the fetch.
    func fetchDocuments<T: Codable>(collectionPath: String, constraints: [QueryConstraint], completion: @escaping (Result<[T], Error>) -> Void)
    
    /// Gets the count of documents in a collection based on query constraints.
    /// - Parameters:
    ///   - constraints: The query constraints to apply.
    ///   - completion: The completion handler with the result of the count.
    func countDocuments(constraints: [QueryConstraint], completion: @escaping (Result<Int, Error>) -> Void)
    
    /// Gets the count of documents in a custom collection based on query constraints.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - constraints: The query constraints to apply.
    ///   - completion: The completion handler with the result of the count.
    func countDocuments(collectionPath: String, constraints: [QueryConstraint], completion: @escaping (Result<Int, Error>) -> Void)
}
