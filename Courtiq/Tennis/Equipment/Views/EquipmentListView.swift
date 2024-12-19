//
//  EquipmentListView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-16.
//

import SwiftUI
import RDDesignSystem
import EquipmentService

public struct EquipmentListView: View {
    
    init(vm: EquipmentVM) {
        self.vm = vm
    }

    public var body: some View {
        VStack {
            if vm.myEquipment.isEmpty {
                Text("Empty")
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(vm.myEquipment, id: \.id) { equipment in
                            EquipmentListCellView(
                                name: equipment.name,
                                equipmentType: "\(equipment.type.rawValue)", // Assuming `type` is an enum
                                brand: equipment is TennisRacket ? (equipment as? TennisRacket)?.brand ?? "Unknown" : "N/A",
                                model: equipment is TennisRacket ? (equipment as? TennisRacket)?.model ?? "Unknown" : "N/A"
                            )
                        }
                    }
                }
            }
        }
    }

    
    @ObservedObject private var vm: EquipmentVM
}
