//
//  SettingsView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-07.
//

import RDDesignSystem
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var router: AppRouter
    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Settings", leading: {}, trailing: {
                Image.Token.Icons.close
                    .rdActionIcon {
                        router.handle(action: .dismiss)
                    }
            })
        } content: {
            Text("Settings")
                .rdTitle1()
        } footer: {
            EmptyView()
        }
    }
}

#Preview {
    SettingsView()
}