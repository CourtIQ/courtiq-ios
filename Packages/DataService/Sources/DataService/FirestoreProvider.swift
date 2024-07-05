//
//  FirestoreProvider.swift
//  DataService
//
//  Created by Pranav Suri on 2024-07-04.
//

import FirebaseFirestore

/// Firestore provider that conforms to DataServiceProviderProtocol.
public class FirestoreProvider: DataServiceProviderProtocol {
    
    // MARK: - Properties
    
    public var collection: String
    private let db = Firestore.firestore()

    // MARK: - Initializer
    
    public init(collection: String = "") {
        self.collection = collection
    }

    // MARK: - Methods
    
    public func fetchDocument<T: Codable>(documentID: String, completion: @escaping (Result<T, Error>) -> Void) {
        db.collection(collection).document(documentID).getDocument { document, error in
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

    public func updateDocument<T: Codable>(documentID: String, document: T, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            let _ = try db.collection(collection).document(documentID).setData(from: document) { error in
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

    public func deleteDocument(documentID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection(collection).document(documentID).delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }

    public func addDocument<T: Codable>(document: T, completion: @escaping (Result<String, Error>) -> Void) {
        do {
            let ref = try db.collection(collection).addDocument(from: document)
            completion(.success(ref.documentID))
        } catch {
            completion(.failure(error))
        }
    }

    public func fetchDocuments<T: Codable>(query: [String: Any], completion: @escaping (Result<[T], Error>) -> Void) {
        var firestoreQuery: Query = db.collection(collection)
        
        query.forEach { key, value in
            firestoreQuery = firestoreQuery.whereField(key, isEqualTo: value)
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
}
