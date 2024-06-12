//
//  ChipComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 09/11/2023.
//

import SwiftUI
import DynamicLayers

struct ChipComponent: View {
    
    @State var isChip1Active = false
    @State var isChip2Active = false
    @State var isChip3Active = false
    
    var body: some View {
        VStack {
            CKChipView(title: "Chip", isActive: $isChip1Active, leadingIcon: "ic_PlaceholderBlack")
            CKChipView(title: "Chip", isActive: $isChip2Active, ckChipType: .medium, leadingIcon: "ic_PlaceholderBlack")
            CKChipView(title: "Chip", isActive: $isChip3Active, ckChipType: .small, leadingIcon: "ic_PlaceholderBlack")
            Spacer()
        }
        .navigationTitle("Chip")
        .padding()
    }
}

struct ChipComponent_Previews: PreviewProvider {
    static var previews: some View {
        ChipComponent()
    }
}
