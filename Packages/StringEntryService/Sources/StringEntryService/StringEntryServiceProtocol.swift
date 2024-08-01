//
//  StringEntryServiceProtocol.swift
//
//
//  Created by Pranav Suri on 2024-07-31.
//

import Foundation

@available(iOS 13.0, *)
public protocol StringEntryServiceProtocol: ObservableObject {
    func fetchString(byID stringID: String) async throws -> StringEntry
    func deleteString(byID stringID: String) async throws
    func createStringEntry(_ entry: StringEntry) async throws -> String
}
