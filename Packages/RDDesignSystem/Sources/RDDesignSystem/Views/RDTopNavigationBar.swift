//
//  RDTopNavigationBar.swift
//
//
//  Created by Pranav Suri on 13/06/2024.
//

import SwiftUI

public enum RDTopNavigationType {
    case primary
    case primaryWithSearch
    case primaryWithProfileAvatar
    case onlySearchWithIcons
    
    var titleSize: CGFloat {
        switch self {
        case .primary, .primaryWithSearch, .onlySearchWithIcons:
            return 18
        case .primaryWithProfileAvatar:
            return 20
        }
    }
}

@available(iOS 13.0, *)
public struct RDTopNavigationParams {
    var type: RDTopNavigationType
    let title: String
    var leadingItem: (leadingItemType: RDIconButton.IconButtonType, 
                      leadingItemIcon: Image,
                      leadingItemAction: (() -> ()))?
    var trailingItem: (trailingItemType: RDIconButton.IconButtonType, 
                       trailingItemIcon: Image,                      
                       trailingItemAction: (() -> ()))?
    var bgColor: Color = Color.TokenColor.Semantic.Background.default
    
    public init(
        type: RDTopNavigationType = .primary,
        title: String,
        leadingItem: (leadingItemType: RDIconButton.IconButtonType, 
                      leadingItemIcon: Image,
                      leadingItemAction: (() -> ()))? = nil,
        trailingItem: (trailingItemType: RDIconButton.IconButtonType,
                       trailingItemIcon: Image,
                       trailingItemAction: (() -> ()))? = nil)
    {
        self.type = type
        self.title = title
        self.leadingItem = leadingItem
        self.trailingItem = trailingItem
    }
}

@available(iOS 15.0, *)
public struct RDTopNavigationBar: View {
    var params: RDTopNavigationParams
    @Binding var searchText: String?
    var onMicPressed: (() -> Void)?
    
    public init(
        params: RDTopNavigationParams,
        searchText: Binding<String?> = .constant(nil),
        onMicPressed: (() -> Void)? = nil
    ) {
        self.params = params
        self._searchText = searchText
        self.onMicPressed = onMicPressed
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack(spacing: 0) {
                    if params.type == .primaryWithProfileAvatar {
                        RDAvatarView(
                            rdAvatarSizing: .small,
                            rdAvatarBadgeType: .none
                        )
                        .padding(.horizontal, 16)
                        
                        Text(params.title)
                            .rdBodyBold()
                            .lineLimit(1)
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    
                    if let leadingItem = params.leadingItem {
                        RDIconButton(leadingItem.leadingItemType, .small, leadingItem.leadingItemIcon) {
                            leadingItem.leadingItemAction()
                        }
                        .padding(.leading, 16)
                    }
                    
                    if params.type != .primaryWithProfileAvatar {
                        Spacer()
                    }
                    
                    if let trailingItem = params.trailingItem {
                        RDIconButton(trailingItem.trailingItemType, .small, trailingItem.trailingItemIcon) {
                            trailingItem.trailingItemAction()
                        }
                        .padding(.trailing, 16)
                    }
                }
                
                if params.type != .primaryWithProfileAvatar {
                    HStack {
                        Spacer()
                        
                        if params.type == .onlySearchWithIcons {
                            SearchField()
                                .padding(.horizontal, 56)
                        } else {
                            Text(params.title)
                                .rdBodyBold()
                                .lineLimit(1)
//                                .font(.system(size: params.type.titleSize, weight: .bold))
                                .foregroundColor(.primary)
                        }
                        
                        Spacer()
                    }
                }
            }
            .frame(height: 56)
            
            if params.type == .primaryWithSearch {
                SearchField()
                    .padding(.horizontal, 16)
            }
        }
        .background(params.bgColor)
    }
    
    private var nonOptionalSearchText: Binding<String> {
        Binding(
            get: { searchText ?? "" },
            set: { searchText = $0 }
        )
    }
    
    func SearchField() -> some View {
        Text("search field should go here")
    }
}
