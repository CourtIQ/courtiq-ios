//
//  RDTabControlComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 11/11/2023.
//

import SwiftUI
import RDDesignSystem

struct RDTabControlComponent: View {
    
    @State var selectedIndex1 = 0
    @State var selectedIndex2 = 0
    @State var selectedIndex3 = 0
    
    var body: some View {
        VStack(spacing: 20) {
            RDTabControl(items: [
                RDTabControlItem(title: "Label", icon: "ic_PlaceholderBlack"),
                RDTabControlItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .large, notiCount: 100)
            ], selectedIndex: $selectedIndex1)
            
            RDTabControl(items: [
                RDTabControlItem(title: "Label", icon: "ic_PlaceholderBlack"),
                RDTabControlItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .large, notiCount: 5),
                RDTabControlItem(title: "Label", icon: "ic_PlaceholderBlack")
            ], selectedIndex: $selectedIndex2)
            
            RDTabControl(items: [
                RDTabControlItem(title: "Label", icon: "ic_PlaceholderBlack"),
                RDTabControlItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .small),
                RDTabControlItem(title: "Label", icon: "ic_PlaceholderBlack"),
                RDTabControlItem(title: "Label", icon: "ic_PlaceholderBlack")
            ], selectedIndex: $selectedIndex3)
            
            Spacer()
        }
        .navigationTitle("Tab Control")
        .padding(.vertical)
    }
}

struct RDTabControlComponent_Previews: PreviewProvider {
    static var previews: some View {
        RDTabControlComponent()
    }
}
