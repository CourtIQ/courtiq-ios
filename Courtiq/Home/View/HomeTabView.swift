//
//  HomeTabView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import SwiftUI
import RDDesignSystem

struct HomeTabView: View {
    var body: some View {
        HomeTabPage {
            Spacer()
            RDTopNavigationView(params: navigationBarParams)
        } content: {
            RDTopNavigationView(params: navigationBarParams)
        }
    }
    
    private var navigationBarParams = RDTopNavigationParams(
        type: .primary,
        title: "Home",
        leadingItem: AnyView(
            RDIconButton(.tertiary, .small, Image(systemName: "line.horizontal.3"),
            action:
                {
                    print("side menu")
                }
            )
        ),
        trailingItem: AnyView(
            RDAvatarView(
                rdAvatarSizing: .small,
                rdAvatarBadgeType: .none,
                action: 
                    {
                        print("Profile pressed")
                    }
            )
        )
    )
}

#Preview {
    HomeTabView()
}
