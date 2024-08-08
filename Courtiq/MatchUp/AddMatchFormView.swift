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

    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Track a new match", leading: {}, trailing: {
                Image.Token.Icons.close
                    .rdActionIcon {
                        router.handle(action: .dismiss)
                    }
            })
        } content: {
            Text("Hello")
        } footer: {
            RDButtonView(.extraLarge, .ghost, "Next") {
                router.handle(action: .push(AnyView(Text("Hello"))))
            }
        }
    }
}
