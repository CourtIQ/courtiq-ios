//
//  BottomNavigationBarComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 10/11/2023.
//

import SwiftUI
import RDDesignSystem

struct BottomNavigationBarComponent: View {
    
    @State var selectedIndex1 = 0
    let items1: [RDBottomItem] = [
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .small),
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .medium, notiCount: 2)
    ]
    
    @State var selectedIndex2 = 0
    let items2: [RDBottomItem] = [
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack"),
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .large, notiCount: 100),
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack")
    ]
    
    @State var selectedIndex3 = 0
    let items3: [RDBottomItem] = [
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack"),
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .large, notiCount: 100),
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack"),
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack")
    ]
    
    @State var selectedIndex4 = 0
    let items4: [RDBottomItem] = [
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack"),
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack"),
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack", badgeType: .large, notiCount: 22),
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack"),
        RDBottomItem(title: "Label", icon: "ic_PlaceholderBlack")
    ]
    
    var body: some View {
        VStack(spacing: 40) {
            RDBottomNavigationBar(items: items1, selectedIndex: $selectedIndex1)
            RDBottomNavigationBar(items: items2, selectedIndex: $selectedIndex2)
            RDBottomNavigationBar(items: items3, selectedIndex: $selectedIndex3)
            RDBottomNavigationBar(items: items4, selectedIndex: $selectedIndex4)
            
            Spacer()
        }
        .navigationTitle("Bottom Navigation Bar")
        .padding(.vertical)
    }
}

struct BottomNavigationBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationBarComponent()
    }
}
