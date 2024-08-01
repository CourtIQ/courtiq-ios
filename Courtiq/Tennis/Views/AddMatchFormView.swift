//
//  AddMatchFormView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-31.
//

import SwiftUI
import RDDesignSystem

struct AddMatchFormView: View {
    @ObservedObject var router: AppRouter
    
    var body: some View {
        MarqueeView {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Track a new match",
                    trailingItem: AnyView(RDIconButton(.tertiary, .small, Image(systemName: "xmark"), action: {
                        router.handle(action: .dismiss)
                    }))))
        } content: {
            Text("Hello")
        } footer: {
            RDButtonView(.extraLarge, .ghost, "Next") {
                router.handle(action: .push(AnyView(Text("Hello"))))
            }
        }

    }
}
