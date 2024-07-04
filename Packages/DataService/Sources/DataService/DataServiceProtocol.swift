//
//  DataServiceProtocol.swift
//  DataService
//
//  Created by Pranav Suri on 2024-07-04.
//

import Foundation

/// Protocol that defines the operations for a data service.
public protocol DataServiceProtocol {

    /// Fetches a document by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the fetch.
    func fetchDocument<T: Decodable>(documentID: String, completion: @escaping (Result<T, Error>) -> Void)
    
    /// Updates a document by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - document: The document to be updated.
    ///   - completion: The completion handler with the result of the update.
    func updateDocument<T: Encodable>(documentID: String, document: T, completion: @escaping (Result<Void, Error>) -> Void)
    
    /// Deletes a document by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the deletion.
    func deleteDocument(documentID: String, completion: @escaping (Result<Void, Error>) -> Void)
    
    /// Adds a document.
    /// - Parameters:
    ///   - document: The document to be added.
    ///   - completion: The completion handler with the result of the addition.
    func addDocument<T: Encodable>(document: T, completion: @escaping (Result<String, Error>) -> Void)
    
    /// Fetches documents based on a query.
    /// - Parameters:
    ///   - query: The query parameters.
    ///   - completion: The completion handler with the result of the fetch.
    func fetchDocuments<T: Decodable>(query: [String: Any], completion: @escaping (Result<[T], Error>) -> Void)
}
