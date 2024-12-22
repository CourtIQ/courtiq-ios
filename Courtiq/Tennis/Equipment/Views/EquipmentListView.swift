//
//  EquipmentListView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-16.
//

import SwiftUI
import RDDesignSystem
import EquipmentService
import Models

public struct EquipmentListView: View {

    public var body: some View {
        VStack {
            if equipmentStore.myTennisRackets.isEmpty {
                Text("Empty")
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(equipmentStore.myTennisRackets, id: \.id) { racket in
                            EquipmentListCellView(
                                name: racket.name,
                                equipmentType: racket.type.displayName,
                                brand: racket.brand,
                                model: racket.model
                            )
                        }
                    }
                }
            }
        }
    }
    @EnvironmentObject private var equipmentStore: EquipmentStore
}

// MARK: - Mock Data Structure

struct EquipmentListCellData {
    let name: String
    let type: String
    let brand: String?
    let model: String?

    static func random() -> EquipmentListCellData {
        let names = ["Pro Staff", "Pure Aero", "Clash", "Ezone", "Vcore"]
        let types = ["Tennis Racket", "Tennis String"]
        let brands = ["Wilson", "Babolat", "Yonex", "Head", "Prince"]
        let models = ["98", "100", "Tour", "Lite", nil]

        return EquipmentListCellData(
            name: names.randomElement() ?? "Unknown",
            type: types.randomElement() ?? "Unknown",
            brand: brands.randomElement(),
            model: models.randomElement() ?? nil
        )
    }
}
