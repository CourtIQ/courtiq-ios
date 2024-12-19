
//
//  EquipmentType.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Models

extension API.UpdateTennisRacketInput {
    init(domainInput: UpdateTennisRacketInput) {
        self.init(
            name: domainInput.name.map { .some($0) } ?? .null,
            brand: domainInput.brand.map { .some($0) } ?? .null,
            model: domainInput.model.map { .some($0) } ?? .null,
            weight: domainInput.weight.map { .some(Double($0)) } ?? .null
        )
    }
}
