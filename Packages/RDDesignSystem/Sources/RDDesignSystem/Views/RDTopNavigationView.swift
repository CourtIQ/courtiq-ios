//
//  RDTopNavigationView.swift
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
    var leadingItem: AnyView?
    var trailingItem: AnyView?
    var bgColor: Color
    
    public init(
        type: RDTopNavigationType = .primary,
        title: String,
        leadingItem: AnyView? = nil,
        trailingItem: AnyView? = nil,
        bgColor: Color = .white
    ) {
        self.type = type
        self.title = title
        self.leadingItem = leadingItem
        self.trailingItem = trailingItem
        self.bgColor = bgColor
    }
}

@available(iOS 15.0, *)
public struct RDTopNavigationView: View {
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
                        leadingItem
                            .padding(.leading, 16) // Add padding to the leading item
                    }
                    
                    if params.type != .primaryWithProfileAvatar {
                        Spacer()
                    }
                    
                    if let trailingItem = params.trailingItem {
                        trailingItem
                            .padding(.trailing, 16) // Add padding to the trailing item
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
        .background(Color.TokenColor.Semantic.Background.default)
    }
    
    private var nonOptionalSearchText: Binding<String> {
        Binding(
            get: { searchText ?? "" },
            set: { searchText = $0 }
        )
    }
    
    func SearchField() -> some View {
        RDTextField(
            params: RDTextFieldParams(
                type: .search,
                placeholder: "Search",
                height: 40,
                isBorderExists: false
            ),
            text: nonOptionalSearchText,
            status: .constant(.none),
            errorString: .constant(""),
            onTrailingIconPressed: onMicPressed
        )
    }
}
