//
//  CKTabControlComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 11/11/2023.
//

import SwiftUI
import DynamicLayers

struct CKTabControlComponent: View {
    
    @State var selectedIndex1 = 0
    @State var selectedIndex2 = 0
    @State var selectedIndex3 = 0
    
    var body: some View {
        VStack(spacing: 20) {
            CKTabControl(items: [
                CKTabControlItem(title: "Label", icon: "ic_PlaceholderBlack"),
                CKTabControlItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .large, notiCount: 100)
            ], selectedIndex: $selectedIndex1)
            
            CKTabControl(items: [
                CKTabControlItem(title: "Label", icon: "ic_PlaceholderBlack"),
                CKTabControlItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .large, notiCount: 5),
                CKTabControlItem(title: "Label", icon: "ic_PlaceholderBlack")
            ], selectedIndex: $selectedIndex2)
            
            CKTabControl(items: [
                CKTabControlItem(title: "Label", icon: "ic_PlaceholderBlack"),
                CKTabControlItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .small),
                CKTabControlItem(title: "Label", icon: "ic_PlaceholderBlack"),
                CKTabControlItem(title: "Label", icon: "ic_PlaceholderBlack")
            ], selectedIndex: $selectedIndex3)
            
            Spacer()
        }
        .navigationTitle("Tab Control")
        .padding(.vertical)
    }
}

struct CKTabControlComponent_Previews: PreviewProvider {
    static var previews: some View {
        CKTabControlComponent()
    }
}
