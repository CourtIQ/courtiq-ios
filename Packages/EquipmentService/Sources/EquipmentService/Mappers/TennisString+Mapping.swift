//
//  DateMappers.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Models

extension API.TennisStringFields {
    func toDomain() -> TennisString {
        return TennisString(
            id: id,
            ownerId: ownerId,
            name: name,
            type: EquipmentType(rawValue: type.rawValue) ?? .tennisString,
            createdAt: createdAt.dateValue,      // Assuming API.DateTime -> Date conversion
            updatedAt: updatedAt.dateValue,
            racket: racket,
            brand: brand,
            brandId: brandId,
            model: model,
            modelId: modelId,
            tension: tension?.toDomain(),
            stringingDate: stringingDate?.dateValue,
            burstDate: burstDate?.dateValue
        )
    }
}

extension API.TennisStringFields.Tension {
    func toDomain() -> StringTension {
        return StringTension(
            mains: mains,
            crosses: crosses
        )
    }
}
