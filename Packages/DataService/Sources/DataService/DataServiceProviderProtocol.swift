//
//  DataServiceProviderProtocol.swift
//  DataService
//
//  Created by Pranav Suri on 2024-07-04.
//

import Foundation

/// Protocol that defines the operations a data service provider must implement.
public protocol DataServiceProviderProtocol {
    
    /// The collection name used by the provider.
    var collection: String { get set }
    
    /// Fetches a document from a collection by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the fetch.
    func fetchDocument<T: Codable>(documentID: String, completion: @escaping (Result<T, Error>) -> Void)
    
    /// Updates a document in a collection by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - document: The document to be updated.
    ///   - completion: The completion handler with the result of the update.
    func updateDocument<T: Codable>(documentID: String, document: T, completion: @escaping (Result<Void, Error>) -> Void)
    
    /// Deletes a document from a collection by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the deletion.
    func deleteDocument(documentID: String, completion: @escaping (Result<Void, Error>) -> Void)
    
    /// Adds a document to a collection.
    /// - Parameters:
    ///   - document: The document to be added.
    ///   - completion: The completion handler with the result of the addition.
    func addDocument<T: Codable>(document: T, completion: @escaping (Result<String, Error>) -> Void)
    
    /// Fetches documents from a collection based on a query.
    /// - Parameters:
    ///   - query: The query parameters.
    ///   - completion: The completion handler with the result of the fetch.
    func fetchDocuments<T: Codable>(query: [String: Any], completion: @escaping (Result<[T], Error>) -> Void)
}
