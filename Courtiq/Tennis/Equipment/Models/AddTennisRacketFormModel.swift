//
//  NewTennisRacketFormModel.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-18.
//

import Foundation
import EquipmentService

struct AddTennisRacketFormModel {
    var name: String = ""
    var model: String? = nil
    var modelId: Int? = nil
    var brand: String? = nil
    var brandId: Int? = nil
    var weight: Int? = nil
    
    // Convert form values to domain input
    func toCreateInput() -> CreateTennisRacketInput {
        var weightFl: Float? = nil
        if let weight = weight {
            weightFl = Float(weight)
        }
        
        return CreateTennisRacketInput(
            name: name,
            brand: brand,
            brandId: brandId,
            model: model,
            modelId: modelId,
            weight: weightFl
        )
    }
}
