//
//  EquipmentType.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Models

// GraphQL -> Domain
extension API.FullEquipmentFields {
    func toDomain() -> any Equipment {
        // Common fields are available in `equipmentFields`
        let common = self.fragments.equipmentFields
        
        // Determine which specific equipment type we have
        if let racket = self.asTennisRacket?.fragments.tennisRacketFields {
            return racket.toDomain()
        } else if let string = self.asTennisString?.fragments.tennisStringFields {
            return string.toDomain()
        } else {
            // In a well-defined schema, you should always have a concrete type.
            // If not, you could throw an error or return a default.
            fatalError("Unknown equipment type encountered.")
        }
    }
}
