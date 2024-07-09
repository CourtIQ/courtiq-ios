//
//  HomeView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-08.
//

import SwiftUI
import RDDesignSystem

struct HomeView: View {
    @Binding var showSideMenu: Bool
    var body: some View {
        BaseTabPageView {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "CourtIQ",
                    leadingItem: AnyView(
                        RDIconButton(
                            .tertiary, .small, Image(systemName: "line.horizontal.3"),
                            action: {
                                showSideMenu.toggle()
                            }
                        )
                    ),
                    trailingItem: AnyView(
                        RDAvatarView(
                            rdAvatarSizing: .small,
                            rdAvatarBadgeType: .none,
                            action: {
                                print("Profile Button pressed")
                            }
                        )
                    )
                )
            )
        } content: {
            Text("Hello, World!")
        }
    }
}
