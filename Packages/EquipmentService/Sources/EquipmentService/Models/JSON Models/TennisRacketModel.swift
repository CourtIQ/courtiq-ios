//
//  RacketBrand.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-18.
//

import Foundation

public struct TennisRacketModel: Decodable, Identifiable {
    public let model_id: Int
    public let model: String
    
    public var id: Int { model_id }
}
