//
//  RDTabControl.swift
//
//
//  Created by Pranav Suri on 06/12/2024.
//
//
//import SwiftUI
//
import SwiftUI

public struct RDTabControl: View {
    @Binding public var selectedTab: Int
    public var tabControlItems: [TabControlItem]
    
    public init(selectedTab: Binding<Int>,
                tabControlItems: [TabControlItem]) {
        self._selectedTab = selectedTab
        self.tabControlItems = tabControlItems
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(tabControlItems, id: \.tag) { item in
                    TabControlTab(item: item, selectedTab: $selectedTab)
                }
            }
        }
    }
}

public struct TabControlTab: View {
    public let item: TabControlItem
    @Binding public var selectedTab: Int
    
    public var body: some View {
        Button(action: {
            selectedTab = item.tag
        }) {
            VStack {
                HStack(alignment: .center, spacing: 4) {
                    Spacer()
                    if let image = item.icon {
                        image
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(selectedTab == item.tag ?
                                             Color.TokenColor.Semantic.Icon.primary
                                             : Color.TokenColor.Semantic.Icon.secondary)
                    }
                    
                    Text(item.label)
                        .rdSmallBody()
                        .foregroundStyle(selectedTab == item.tag ?
                                         Color.TokenColor.Semantic.Text.primary
                                         : Color.TokenColor.Semantic.Text.secondary)
                    Spacer()
                    
                }
                .padding(.bottom, 4)
                .frame(width: 120, height: 30)

            }
            .border(width: selectedTab == item.tag ? 2 : 1,
                    edges: [.bottom],
                    color: selectedTab == item.tag
                    ? Color.TokenColor.Semantic.Border.emphasis
                    : Color.TokenColor.Semantic.Border.secondary)
            
        }
    }
}

public struct TabControlItem {
    public let tag: Int
    public let label: String
    public let icon: Image?
    
    public init(tag: Int, label: String, icon: Image? = nil) {
        self.tag = tag
        self.label = label
        self.icon = icon
    }
}

#Preview {
    @State var selectedTab: Int = 0
    RDTabControl(
        selectedTab: Binding(get: {
            selectedTab
        }, set: { value in
            selectedTab = value
        }),
        tabControlItems: [
            TabControlItem(tag: 0, label: "All", icon: Image.Token.Icons.world),
            TabControlItem(tag: 1, label: "Matches", icon: Image.Token.Icons.person),
                    TabControlItem(tag: 2, label: "Equipment", icon: Image.Token.Icons.settings)
                 ])
}
