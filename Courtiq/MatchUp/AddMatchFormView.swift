//
//  MatchUpFormView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-31.
//

import SwiftUI
import RDDesignSystem

struct MatchUpFormView: View {
    @ObservedObject var router: AppRouter

    private var navigationParams: RDTopNavigationParams {
        RDTopNavigationParams(
            type: .primary,
            title: "Track a new match",
            trailingItem: (
                trailingItemType: .tertiary,
                trailingItemIcon: Image(systemName: "xmark"),
                trailingItemAction: {
                    router.handle(action: .dismiss)
                }
            )
        )
    }

    var body: some View {
        MarqueeView {
            RDTopNavigationBar(params: navigationParams)
        } content: {
            Text("Hello")
        } footer: {
            RDButtonView(.extraLarge, .ghost, "Next") {
                router.handle(action: .push(AnyView(Text("Hello"))))
            }
        }
    }
}
