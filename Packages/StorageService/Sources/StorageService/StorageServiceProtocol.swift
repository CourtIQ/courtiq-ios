//
//  StorageServiceProtocol.swift
//
//
//  Created by Pranav Suri on 2024-07-08.
//

import Foundation

// Protocol for Firebase Storage Service
public protocol StorageServiceProtocol {
    func uploadData(_ data: Data, to path: String) async throws -> URL
    func downloadData(from path: String) async throws -> Data
    func deleteData(at path: String) async throws
}
