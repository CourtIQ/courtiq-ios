//
//  DateMappers.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Models

extension API.TennisRacketFields {
    func toDomain() -> TennisRacket {
        return TennisRacket(
            id: id,
            ownerId: ownerId,
            name: name,
            type: EquipmentType(rawValue: type.rawValue) ?? .tennisRacket,
            createdAt: createdAt.dateValue,
            updatedAt: updatedAt.dateValue,
            currentStringId: currentStringId,
            brand: brand,
            brandId: brandId,
            model: model,
            modelId: modelId,
            weight: weight != nil ? Float(weight!) : nil
        )
    }
}
