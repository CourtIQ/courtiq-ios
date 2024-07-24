//
//  TennisView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-08.
//

import SwiftUI
import RDDesignSystem

struct TennisView: View {
    @Binding var showSideMenu: Bool

    var body: some View {
        BaseTabPageView {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Tennis",
                    leadingItem: AnyView(
                        RDIconButton(
                            .tertiary, .small, Image(systemName: "line.horizontal.3"),
                            action: {
                                showSideMenu.toggle()
                            }
                        )
                    ),
                    trailingItem: AnyView(
                        RDIconButton(.tertiary, .small, Image("play"), action: {
                            print("Add Button pressed")
                        })
                    )
                )
            )

        } content: {
            Text("TennisView")
        }
    }
}
