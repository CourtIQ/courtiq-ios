//
//  TennisStringBrand.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-18.
//

import Foundation

public struct TennisStringBrand: Decodable, Identifiable {
    public let brand_id: Int
    public let brand: String
    public let models: [TennisStringModel]
    
    public var id: Int { brand_id }
}
