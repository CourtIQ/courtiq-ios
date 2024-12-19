//
//  RacketBrand.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-18.
//

import Foundation

public struct TennisRacketBrand: Decodable, Identifiable {
    public let brand_id: Int
    public let brand: String
    public let models: [TennisRacketModel]
    
    public var id: Int { brand_id }
}
