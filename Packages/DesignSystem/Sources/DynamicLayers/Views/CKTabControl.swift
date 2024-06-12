//
//  CKTabControl.swift
//  
//
//  Created by DynamicLayers on 11/11/2023.
//

import SwiftUI

public struct CKTabControlItem {
    let id = UUID().uuidString
    let title: String
    let icon: String
    var badgeType: CKNotificationBadgeType?
    var notiCount: Int?
    
    public init(
        title: String,
        icon: String,
        badgeType: CKNotificationBadgeType? = nil,
        notiCount: Int? = nil
    ) {
        self.title = title
        self.icon = icon
        self.badgeType = badgeType
        self.notiCount = notiCount
    }
    
    public func getOffset() -> (x: CGFloat, y: CGFloat) {
        if badgeType == .small {
            return (6, -4)
        }else {
            if notiCount ?? 0 < 10 {
                return (12, -8)
            } else if notiCount ?? 0 > 9 {
                return (14, -14)
            } else if notiCount ?? 0 > 99 {
                return (30, -18)
            }
        }
        return (8, -8)
    }
}

@available(iOS 15.0, *)
public struct CKTabControl: View {
    
    let items: [CKTabControlItem]
    @Binding var selectedIndex: Int
    
    public init(items: [CKTabControlItem], selectedIndex: Binding<Int>) {
        self.items = items
        self._selectedIndex = selectedIndex
    }
    
    public var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: items.count)) {
            ForEach((0..<items.count), id: \.self){ index in
                TabItem(item: items[index], isSelected: selectedIndex == index){
                    selectedIndex = index
                }
            }
        }
        .padding(.top, 6)
    }
    
    func TabItem(item: CKTabControlItem, isSelected: Bool, action: @escaping (()->())) -> some View {
        HStack(spacing: 8) {
            Image(item.icon)
                .resizable()
                .frame(width: 24, height: 24)
                .opacity(isSelected ? 1 : 0.3)
            
            ZStack(alignment: .topTrailing) {
                Text(item.title)
                    .font(.system(size: 12, weight: .bold))
                    .opacity(isSelected ? 1 : 0.3)
                
                if let badgeType = item.badgeType {
                    CKNotificationBadgeView(type: badgeType, notiCount: item.notiCount)
                        .offset(x: item.getOffset().x, y: item.getOffset().y)
                }
            }
        }
        .frame(maxWidth: .infinity, minHeight: 56)
        .border(width: 2, edges: [.bottom], color: .black.opacity(isSelected ? 1 : 0.2))
        .onTapGesture {
            withAnimation {
                action()
            }
        }
    }
}
