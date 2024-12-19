//
//  EquipmentType.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Models

// GraphQL -> Domain
extension EquipmentType {
    init(graphqlType: API.EquipmentType) {
        switch graphqlType {
        case .tennisRacket:
            self = .tennisRacket
        case .tennisString:
            self = .tennisString
        }
    }
}

// Domain -> GraphQL
extension API.EquipmentType {
    init(domainType: EquipmentType) {
        switch domainType {
        case .tennisRacket:
            self = .tennisRacket
        case .tennisString:
            self = .tennisString
        }
    }
}
