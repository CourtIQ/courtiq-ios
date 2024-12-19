////
////  RDTabControl.swift
////
////
////  Created by Pranav Suri on 06/12/2024.
////
//
//import SwiftUI
//
//public struct RDTabControl: View {
//    @Binding public var selectedTab: Int
//    public var tabControlItems: [TabControlItem]
//    public init(selectedTab: Binding<Int>, tabControlItems: [TabControlItem]) {
//        self._selectedTab = selectedTab
//        self.content = content()
//    }
//    
//    public var body: some View {
//        ScrollView {
//            HStack {
//                
//            }
//        }
//        
//    }
//}
//
//public struct TabControlTab: View {
//    public let item: TabControlItem
//    @Binding public var selectedTab: Int
//    
//    public var body: some View {
//        Button(action: { selectedTab = item.label }) {
//            item.icon?.foregroundColor(selectedTab == item.label ? .reduce : .primary)
//        }
//        
//    }
//}
//
//public struct TabControlItem {
//    // maybe add tag here
//    public let label: String
//    public let icon: Image?
//}
//#Preview {
//    RDTabControl(selectedTab: .constant(0), tabControlItems: []) {
//        Text("Hello, World!")
//    }
//}
//
//
