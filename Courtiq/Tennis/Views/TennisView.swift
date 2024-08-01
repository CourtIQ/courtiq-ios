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
    @EnvironmentObject var router: AppRouter
    @StateObject var vm: TennisVM

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
                        Menu(content: {
                            Button("AddStringView") {
                                vm.handle(action: .showAddString)
                            }
                            Button("AddMatchView") {
                                vm.handle(action: .showAddMatch)
                            }
                        }, label: {
                            RDIconButton(.tertiary, .small, Image("play"), action: { return })
                        })
                    )
                )
            )
            .environmentObject(router)

        } content: {
            Text("TennisView")
        }
    }
}
