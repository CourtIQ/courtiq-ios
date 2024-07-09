//
//  ProfileView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-08.
//

import SwiftUI
import RDDesignSystem

struct ProfileView: View {
    @Binding var showSideMenu: Bool
    var body: some View {
        BaseTabPageView {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Profile",
                    leadingItem: AnyView(
                        RDIconButton(
                            .tertiary, .small, Image(systemName: "line.horizontal.3"),
                            action: {
                                showSideMenu.toggle()
                            }
                        )
                    ),
                    trailingItem: AnyView(
                        RDIconButton(.tertiary, .small, Image("settings"), action: {
                            print("Settings Button pressed")

                        })
                    )
                )
            )
        } content: {
            Text("ProfileView")
        }
    }
}
