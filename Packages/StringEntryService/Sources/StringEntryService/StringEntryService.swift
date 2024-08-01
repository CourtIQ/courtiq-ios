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
    private let collectionName = "strings"

    // MARK: - Initializer
    
    public init(dataService: DataServiceProtocol = DataService(provider: FirestoreProvider(collection: "strings"))) {
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
        print(#function)
    }
}
