//
//  NewTennisStringForm.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-17.
//

import Foundation
import EquipmentService

struct AddTennisStringFormModel {
    var name: String = ""
    var model: String? = nil
    var modelId: Int? = nil
    var brand: String? = nil
    var brandId: Int? = nil
    var stringingDate: Date? = nil
    var burstDate: Date? = nil
    var mainsTension: Int? = nil
    var crossTension: Int? = nil
    
    // Convert form values to domain input
    func toCreateInput() -> CreateTennisStringInput {
        // Create a StringTension object only if at least one tension is set
        let tension = (mainsTension != nil || crossTension != nil)
            ? StringTension(mains: mainsTension, crosses: crossTension)
            : nil
        
        return CreateTennisStringInput(
            name: name,
            brand: brand,
            model: model,
            tension: tension,
            stringingDate: stringingDate,
            burstDate: burstDate
        )
    }
}
