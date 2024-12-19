//
//  CreateTennisRacketInput+Mapping.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Models

extension API.CreateTennisRacketInput {
    init(domainInput: CreateTennisRacketInput) {
        self.init(
            name: domainInput.name,
            brand: domainInput.brand.map { .some($0) } ?? .null,
            brandId: domainInput.brandId.map { .some($0) } ?? .null,
            model: domainInput.model.map { .some($0) } ?? .null,
            modelId: domainInput.modelId.map { .some($0) } ?? .null,
            weight: domainInput.weight.map { .some(Double($0)) } ?? .null
        )
    }
}
