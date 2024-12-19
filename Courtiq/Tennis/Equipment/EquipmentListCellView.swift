//
//  EquipmentListCellView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-18.
//

import RDDesignSystem
import SwiftUI

struct EquipmentListCellView: View {
    
    init(name: String,
         equipmentType: String,
         brand: String? = nil,
         model: String? = nil) {
        self.name = name
        self.equipmentType = equipmentType
        self.brand = brand
        self.model = model
    }
    
    var body: some View {
        RDCard(type: .primary) {
            VStack {
                HStack {
                    Text(name)
                        .rdBodyBold()
                        .foregroundStyle(Color.TokenColor.Semantic.Text.default)
                    Spacer()
                    RDBadgeView(label: "\(equipmentType)", rdBadgeType: .secondary)
                }
                if let brand = brand,
                   let model = model {
                    HStack {
                        Text("\(brand)")
                            .rdSmallBody()
                            .foregroundStyle(Color.TokenColor.Semantic.Text.secondary)
                        Spacer()
                        Text("\(model)")
                            .rdSmallBody()
                            .foregroundStyle(Color.TokenColor.Semantic.Text.secondary)
                    }
                }
            }
        }
        .padding(.horizontal, 12)
    }
    
    private let name: String
    private let equipmentType: String
    private let brand: String?
    private let model: String?
}
//
//#Preview {
//    EquipmentListCellView()
//}
