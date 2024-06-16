//
//  ChipComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 09/11/2023.
//

import SwiftUI
import RDDesignSystem

struct ChipComponent: View {
    
    @State var isChip1Active = false
    @State var isChip2Active = false
    @State var isChip3Active = false
    
    var body: some View {
        VStack {
            RDChipView(title: "Chip", isActive: $isChip1Active, leadingIcon: "ic_PlaceholderBlack")
            RDChipView(title: "Chip", isActive: $isChip2Active, rdChipType: .medium, leadingIcon: "ic_PlaceholderBlack")
            RDChipView(title: "Chip", isActive: $isChip3Active, rdChipType: .small, leadingIcon: "ic_PlaceholderBlack")
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
