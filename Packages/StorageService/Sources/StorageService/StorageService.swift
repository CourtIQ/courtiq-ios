//
//  StorageServiceProtocol.swift
//  StorageService
//
//  Created by Pranav Suri on 2024-07-08.
//

import Foundation
import FirebaseStorage

public class StorageService: StorageServiceProtocol {
    private let storage: Storage
    
    public init(storage: Storage = Storage.storage()) {
        self.storage = storage
    }
    
    public func uploadData(_ data: Data, to path: String) async throws -> URL {
        let storageRef = storage.reference().child(path)
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<URL, Error>) in
            storageRef.putData(data, metadata: nil) { metadata, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    storageRef.downloadURL { url, error in
                        if let error = error {
                            continuation.resume(throwing: error)
                        } else if let url = url {
                            continuation.resume(returning: url)
                        }
                    }
                }
            }
        }
    }
    
    public func downloadData(from path: String) async throws -> Data {
        let storageRef = storage.reference().child(path)
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Data, Error>) in
            storageRef.getData(maxSize: 10 * 1024 * 1024) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let data = data {
                    continuation.resume(returning: data)
                }
            }
        }
    }
    
    public func deleteData(at path: String) async throws {
        let storageRef = storage.reference().child(path)
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            storageRef.delete { error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        }
    }
}
