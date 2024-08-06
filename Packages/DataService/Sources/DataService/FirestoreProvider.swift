//
//  FirestoreProvider.swift
//  DataService
//
//  Created by Pranav Suri on 2024-07-04.
//

import FirebaseFirestore

// MARK: - FirestoreProvider

/// Firestore provider that conforms to DataServiceProviderProtocol.
public class FirestoreProvider: DataServiceProviderProtocol {
    
    // MARK: - Properties
    
    /// The collection path used by the provider.
    public var collectionPath: String
    
    /// Firestore database instance.
    private let db: Firestore

    // MARK: - Initializer
    
    /// Initializes the FirestoreProvider with a specific collection path.
    /// - Parameter collectionPath: The path of the Firestore collection.
    public init(collectionPath: String, db: Firestore = Firestore.firestore()) {
        self.collectionPath = collectionPath
        self.db = db
    }

    // MARK: - Document Operations
    
    /// Fetches a document from a collection by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the fetch.
    public func fetchDocument<T: Codable>(documentID: String, completion: @escaping (Result<T, Error>) -> Void) {
        fetchDocument(collectionPath: collectionPath, documentID: documentID, completion: completion)
    }
    
    /// Fetches a document from a custom collection by document ID.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the fetch.
    public func fetchDocument<T: Codable>(collectionPath: String, documentID: String, completion: @escaping (Result<T, Error>) -> Void) {
        db.collection(collectionPath).document(documentID).getDocument { document, error in
            if let error = error {
                completion(.failure(error))
            } else {
                do {
                    let doc = try document?.data(as: T.self)
                    if let doc = doc {
                        completion(.success(doc))
                    } else {
                        completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Document not found"])))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }

    /// Updates a document in a collection by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - document: The document to be updated.
    ///   - completion: The completion handler with the result of the update.
    public func updateDocument<T: Codable>(documentID: String, document: T, completion: @escaping (Result<Void, Error>) -> Void) {
        updateDocument(collectionPath: collectionPath, documentID: documentID, document: document, completion: completion)
    }
    
    /// Updates a document in a custom collection by document ID.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - documentID: The document ID.
    ///   - document: The document to be updated.
    ///   - completion: The completion handler with the result of the update.
    public func updateDocument<T: Codable>(collectionPath: String, documentID: String, document: T, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try db.collection(collectionPath).document(documentID).setData(from: document, merge: true) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }

    /// Deletes a document from a collection by document ID.
    /// - Parameters:
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the deletion.
    public func deleteDocument(documentID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        deleteDocument(collectionPath: collectionPath, documentID: documentID, completion: completion)
    }
    
    /// Deletes a document from a custom collection by document ID.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - documentID: The document ID.
    ///   - completion: The completion handler with the result of the deletion.
    public func deleteDocument(collectionPath: String, documentID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection(collectionPath).document(documentID).delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }

    /// Adds a document to a collection.
    /// - Parameters:
    ///   - document: The document to be added.
    ///   - completion: The completion handler with the result of the addition.
    public func addDocument<T: Codable>(document: T, completion: @escaping (Result<String, Error>) -> Void) {
        addDocument(collectionPath: collectionPath, document: document, completion: completion)
    }
    
    /// Adds a document to a custom collection.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - document: The document to be added.
    ///   - completion: The completion handler with the result of the addition.
    public func addDocument<T: Codable>(collectionPath: String, document: T, completion: @escaping (Result<String, Error>) -> Void) {
        do {
            let ref = try db.collection(collectionPath).addDocument(from: document)
            completion(.success(ref.documentID))
        } catch {
            completion(.failure(error))
        }
    }

    // MARK: - Query Operations
    
    /// Fetches documents from a collection based on query constraints.
    /// - Parameters:
    ///   - constraints: The query constraints to apply.
    ///   - completion: The completion handler with the result of the fetch.
    public func fetchDocuments<T: Codable>(constraints: [QueryConstraint], completion: @escaping (Result<[T], Error>) -> Void) {
        fetchDocuments(collectionPath: collectionPath, constraints: constraints, completion: completion)
    }
    
    /// Fetches documents from a custom collection based on query constraints.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - constraints: The query constraints to apply.
    ///   - completion: The completion handler with the result of the fetch.
    public func fetchDocuments<T: Codable>(collectionPath: String, constraints: [QueryConstraint], completion: @escaping (Result<[T], Error>) -> Void) {
        var firestoreQuery: Query = db.collection(collectionPath)
        
        for constraint in constraints {
            switch constraint {
            case .equalTo(let field, let value):
                firestoreQuery = firestoreQuery.whereField(field, isEqualTo: value)
            case .lessThan(let field, let value):
                firestoreQuery = firestoreQuery.whereField(field, isLessThan: value)
            case .greaterThan(let field, let value):
                firestoreQuery = firestoreQuery.whereField(field, isGreaterThan: value)
            case .lessThanOrEqualTo(let field, let value):
                firestoreQuery = firestoreQuery.whereField(field, isLessThanOrEqualTo: value)
            case .greaterThanOrEqualTo(let field, let value):
                firestoreQuery = firestoreQuery.whereField(field, isGreaterThanOrEqualTo: value)
            case .arrayContains(let field, let value):
                firestoreQuery = firestoreQuery.whereField(field, arrayContains: value)
            case .in(let field, let values):
                firestoreQuery = firestoreQuery.whereField(field, in: values)
            case .notIn(let field, let values):
                firestoreQuery = firestoreQuery.whereField(field, notIn: values)
            }
        }

        firestoreQuery.getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
            } else {
                do {
                    let documents = try snapshot?.documents.compactMap { doc in
                        try doc.data(as: T.self)
                    }
                    completion(.success(documents ?? []))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    /// Gets the count of documents in a collection based on query constraints.
    /// - Parameters:
    ///   - constraints: The query constraints to apply.
    ///   - completion: The completion handler with the result of the count.
    public func countDocuments(constraints: [QueryConstraint], completion: @escaping (Result<Int, Error>) -> Void) {
        countDocuments(collectionPath: collectionPath, constraints: constraints, completion: completion)
    }
    
    /// Gets the count of documents in a custom collection based on query constraints.
    /// - Parameters:
    ///   - collectionPath: The path of the collection.
    ///   - constraints: The query constraints to apply.
    ///   - completion: The completion handler with the result of the count.
    public func countDocuments(collectionPath: String, constraints: [QueryConstraint], completion: @escaping (Result<Int, Error>) -> Void) {
        var firestoreQuery: Query = db.collection(collectionPath)
        
        for constraint in constraints {
            switch constraint {
            case .equalTo(let field, let value):
                firestoreQuery = firestoreQuery.whereField(field, isEqualTo: value)
            case .lessThan(let field, let value):
                firestoreQuery = firestoreQuery.whereField(field, isLessThan: value)
            case .greaterThan(let field, let value):
                firestoreQuery = firestoreQuery.whereField(field, isGreaterThan: value)
            case .lessThanOrEqualTo(let field, let value):
                firestoreQuery = firestoreQuery.whereField(field, isLessThanOrEqualTo: value)
            case .greaterThanOrEqualTo(let field, let value):
                firestoreQuery = firestoreQuery.whereField(field, isGreaterThanOrEqualTo: value)
            case .arrayContains(let field, let value):
                firestoreQuery = firestoreQuery.whereField(field, arrayContains: value)
            case .in(let field, let values):
                firestoreQuery = firestoreQuery.whereField(field, in: values)
            case .notIn(let field, let values):
                firestoreQuery = firestoreQuery.whereField(field, notIn: values)
            }
        }

        firestoreQuery.getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
            } else {
                let count = snapshot?.count ?? 0
                completion(.success(count))
            }
        }
    }
}
