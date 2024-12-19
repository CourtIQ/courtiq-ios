//
//  CreateTennisRacketInput+Mapping.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Models

extension API.CreateTennisStringInput {
    init(domainInput: CreateTennisStringInput) {
        self.init(
            name: domainInput.name,
            brand: domainInput.brand.map { .some($0) } ?? .null,
            brandId: domainInput.brandId.map{ .some($0)} ?? .null,
            model: domainInput.model.map { .some($0) } ?? .null,
            modelId: domainInput.modelId.map { .some($0) } ?? .null,
            tension: domainInput.tension.map { .some(API.StringTensionInput(domainTension: $0)) } ?? .null,
            stringingDate: .from(domainInput.stringingDate),
            burstDate: .from(domainInput.burstDate)
        )
    }
}
