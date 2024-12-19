
//
//  EquipmentType.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Models

extension API.UpdateTennisStringInput {
    init(domainInput: UpdateTennisStringInput) {
        self.init(
            name: domainInput.name.map { .some($0) } ?? .null,
            brand: domainInput.brand.map { .some($0) } ?? .null,
            model: domainInput.model.map { .some($0) } ?? .null,
            tension: domainInput.tension.map { .some(API.StringTensionInput(domainTension: $0)) } ?? .null,
            stringingDate: domainInput.stringingDate.map { .some($0.toISO8601String()) } ?? .null,
            burstDate: domainInput.burstDate.map { .some($0.toISO8601String()) } ?? .null
        )
    }
}

// Assuming you need a similar mapping for StringTension -> StringTensionInput:
extension API.StringTensionInput {
    init(domainTension: StringTension) {
        self.init(
            mains: domainTension.mains.map { .some($0) } ?? .null,
            crosses: domainTension.crosses.map { .some($0) } ?? .null
        )
    }
}
