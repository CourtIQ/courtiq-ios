//
//  EquipmentServiceImpl.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation

public final class EquipmentService: EquipmentServiceProtocol {
    // MARK: - Dependencies
    private let racketRepo: TennisRacketRepositoryProtocol
    private let stringRepo: TennisStringRepositoryProtocol
    
    // MARK: - Caching
    @Published private(set) var racketBrands: [TennisRacketBrand] = []
    @Published private(set) var stringBrands: [TennisStringBrand] = []

    
    public init(racketRepo: TennisRacketRepositoryProtocol,
                stringRepo: TennisStringRepositoryProtocol) {
        self.racketRepo = racketRepo
        self.stringRepo = stringRepo
        loadRacketBrandsData()
        loadTennisStringBrands()
    }
    
    public func createTennisRacket(input: CreateTennisRacketInput) async throws -> TennisRacket {
        return try await racketRepo.create(input: input)
    }
    
    public func updateMyTennisRacket(id: String, input: UpdateTennisRacketInput) async throws -> TennisRacket {
        return try await racketRepo.update(id: id, input: input)
    }
    
    public func deleteMyTennisRacket(id: String) async throws -> Bool {
        return try await racketRepo.delete(id: id)
    }
    
    public func getMyTennisRackets(limit: Int, offset: Int) async throws -> [TennisRacket] {
        return try await racketRepo.fetchAll(limit: limit, offset: offset)
    }
    
    public func getMyTennisRacket(id: String) async throws -> TennisRacket? {
        return try await racketRepo.fetch(id: id)
    }
    
    public func getMyStringHistory(forRacketID: String) async throws -> [TennisString] {
        return try await racketRepo.fetchStringHistory(racketId: forRacketID)
    }
    
    // MARK: - String Operations
    
    public func createTennisString(input: CreateTennisStringInput) async throws -> TennisString {
        return try await stringRepo.create(input: input)
    }
    
    public func updateMyTennisString(id: String, input: UpdateTennisStringInput) async throws -> TennisString {
        return try await stringRepo.update(id: id, input: input)
    }
    
    public func deleteMyTennisString(id: String) async throws -> Bool {
        return try await stringRepo.delete(id: id)
    }
    
    public func getMyTennisStrings(limit: Int, offset: Int) async throws -> [TennisString] {
        return try await stringRepo.fetchAll(limit: limit, offset: offset)
    }
    
    public func getMyTennisString(id: String) async throws -> TennisString? {
        return try await stringRepo.fetch(id: id)
    }
    
    // MARK: - Combined Operations
    
    public func assignRacketToString(racketId: String, stringId: String) async throws -> TennisString {
        return try await stringRepo.assignRacketToString(racketId: racketId, stringId: stringId)
    }
    
    private func loadRacketBrandsData() {
        // Adjust this to your resource location. If this code is in a Swift package,
        // you might need `Bundle.module` instead of `Bundle.main`.
        guard let url = Bundle.module.url(forResource: "RacketBrands", withExtension: "json") else {
            print("RacketBrands.json not found.")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            self.racketBrands = try JSONDecoder().decode([TennisRacketBrand].self, from: data)
        } catch {
            print("Failed to decode RacketBrands.json: \(error)")
        }
    }
    
    private func loadTennisStringBrands() {
        // Adjust this to your resource location. If this code is in a Swift package,
        // you might need `Bundle.module` instead of `Bundle.main`.
        guard let url = Bundle.module.url(forResource: "TennisStringBrands", withExtension: "json") else {
            print("TennisStringBrands.json not found.")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            self.stringBrands = try JSONDecoder().decode([TennisStringBrand].self, from: data)
        } catch {
            print("Failed to decode TennisStringBrands.json: \(error)")
        }
    }

    
    /// Returns all known brands.
    public func getAllRacketBrands() -> [TennisRacketBrand] {
        return racketBrands
    }
    
    public func getAllStringBrands() -> [TennisStringBrand] {
        return stringBrands
    }
    
    /// Gets a specific brand by name (case-insensitive).
    /// If not found, returns a "None" brand.
    public func getRacketBrand(for brandName: String) -> TennisRacketBrand {
        let lowerName = brandName.lowercased()
        guard let brand = racketBrands.first(where: { $0.brand.lowercased() == lowerName }) else {
            let noneId = self.getRacketBrand(for: "None")
            return TennisRacketBrand(brand_id: -1, brand: "None", models: [TennisRacketModel(model_id: -1, model: "None")])
        }
        return brand
    }
    
    /// Gets models for a given brand name (case-insensitive).
    /// If no brand matches, returns a single "None" model.
    public func getRacketModels(for brandName: String) -> [TennisRacketModel] {
        let lowerName = brandName.lowercased()
        guard let brand = racketBrands.first(where: { $0.brand.lowercased() == lowerName }) else {
            return [TennisRacketModel(model_id: -1, model: "None")]
        }
        return brand.models
    }
}
