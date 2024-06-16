//
//  IconButtonComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 09/11/2023.
//

import SwiftUI
import RDDesignSystem

struct IconButtonComponent: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                RDIconButton(.primary, .extraLarge, "ic_PlaceholderWhite")
                Spacer()
                RDIconButton(.primary, .large, "ic_PlaceholderWhite")
                Spacer()
                RDIconButton(.primary, .medium, "ic_PlaceholderWhite")
                Spacer()
                RDIconButton(.primary, .small, "ic_PlaceholderWhite")
            }
            HStack {
                RDIconButton(.primary, .extraLarge, "ic_PlaceholderWhite", true)
                Spacer()
                RDIconButton(.primary, .large, "ic_PlaceholderWhite", true)
                Spacer()
                RDIconButton(.primary, .medium, "ic_PlaceholderWhite", true)
                Spacer()
                RDIconButton(.primary, .small, "ic_PlaceholderWhite", true)
            }
            HStack {
                RDIconButton(.secondary, .extraLarge, "ic_PlaceholderWhite")
                Spacer()
                RDIconButton(.secondary, .large, "ic_PlaceholderWhite")
                Spacer()
                RDIconButton(.secondary, .medium, "ic_PlaceholderWhite")
                Spacer()
                RDIconButton(.secondary, .small, "ic_PlaceholderWhite")
            }
            HStack {
                RDIconButton(.secondary, .extraLarge, "ic_PlaceholderWhite", true)
                Spacer()
                RDIconButton(.secondary, .large, "ic_PlaceholderWhite", true)
                Spacer()
                RDIconButton(.secondary, .medium, "ic_PlaceholderWhite", true)
                Spacer()
                RDIconButton(.secondary, .small, "ic_PlaceholderWhite", true)
            }
            HStack {
                RDIconButton(.tertiary, .extraLarge, "ic_PlaceholderWhite")
                Spacer()
                RDIconButton(.tertiary, .large, "ic_PlaceholderWhite")
                Spacer()
                RDIconButton(.tertiary, .medium, "ic_PlaceholderWhite")
                Spacer()
                RDIconButton(.tertiary, .small, "ic_PlaceholderWhite")
            }
            HStack {
                RDIconButton(.tertiary, .extraLarge, "ic_PlaceholderWhite", true)
                Spacer()
                RDIconButton(.tertiary, .large, "ic_PlaceholderWhite", true)
                Spacer()
                RDIconButton(.tertiary, .medium, "ic_PlaceholderWhite", true)
                Spacer()
                RDIconButton(.tertiary, .small, "ic_PlaceholderWhite", true)
            }
            Spacer()
        }
        .navigationTitle("Icon Button")
        .padding()
    }
}

struct IconButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        IconButtonComponent()
    }
}
