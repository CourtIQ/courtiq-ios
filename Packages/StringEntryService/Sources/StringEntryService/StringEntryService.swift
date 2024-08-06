//
//  StringEntryService.swift
//
//
//  Created by Pranav Suri on 07/31/2024.
//

import DataService
import SwiftUI

@available(iOS 14.0, *)
public class StringEntryService: StringEntryServiceProtocol {
    
    var dataService: DataServiceProtocol
    private let collectionName = "stringEntries"

    // MARK: - Initializer
    
    public init(dataService: DataServiceProtocol = DataService(provider: FirestoreProvider(collectionPath: "stringEntries"))) {
        self.dataService = dataService
    }

    // MARK: - Fetch String by ID
    
    public func fetchString(byID stringID: String) async throws -> StringEntry {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<StringEntry, Error>) in
            dataService.fetchDocument(documentID: stringID) { (result: Result<StringEntry, Error>) in
                switch result {
                case .success(let stringEntry):
                    continuation.resume(returning: stringEntry)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    // MARK: - Delete String by ID

    public func deleteString(byID stringID: String) async throws {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            dataService.deleteDocument(documentID: stringID) { (result: Result<Void, Error>) in
                switch result {
                case .success:
                    continuation.resume(returning: ())
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    // MARK: - Create String Entry

    public func createStringEntry(_ entry: StringEntry) async throws -> String {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<String, Error>) in
            dataService.addDocument(document: entry) { (result: Result<String, Error>) in
                switch result {
                case .success(let documentID):
                    continuation.resume(returning: documentID)
                case .failure(let error):
                    print(error.localizedDescription)
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
