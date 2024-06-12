//
//  IconButtonComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 09/11/2023.
//

import SwiftUI
import DynamicLayers

struct IconButtonComponent: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                CKIconButton(.primary, .extraLarge, "ic_PlaceholderWhite")
                Spacer()
                CKIconButton(.primary, .large, "ic_PlaceholderWhite")
                Spacer()
                CKIconButton(.primary, .medium, "ic_PlaceholderWhite")
                Spacer()
                CKIconButton(.primary, .small, "ic_PlaceholderWhite")
            }
            HStack {
                CKIconButton(.primary, .extraLarge, "ic_PlaceholderWhite", true)
                Spacer()
                CKIconButton(.primary, .large, "ic_PlaceholderWhite", true)
                Spacer()
                CKIconButton(.primary, .medium, "ic_PlaceholderWhite", true)
                Spacer()
                CKIconButton(.primary, .small, "ic_PlaceholderWhite", true)
            }
            HStack {
                CKIconButton(.secondary, .extraLarge, "ic_PlaceholderWhite")
                Spacer()
                CKIconButton(.secondary, .large, "ic_PlaceholderWhite")
                Spacer()
                CKIconButton(.secondary, .medium, "ic_PlaceholderWhite")
                Spacer()
                CKIconButton(.secondary, .small, "ic_PlaceholderWhite")
            }
            HStack {
                CKIconButton(.secondary, .extraLarge, "ic_PlaceholderWhite", true)
                Spacer()
                CKIconButton(.secondary, .large, "ic_PlaceholderWhite", true)
                Spacer()
                CKIconButton(.secondary, .medium, "ic_PlaceholderWhite", true)
                Spacer()
                CKIconButton(.secondary, .small, "ic_PlaceholderWhite", true)
            }
            HStack {
                CKIconButton(.tertiary, .extraLarge, "ic_PlaceholderWhite")
                Spacer()
                CKIconButton(.tertiary, .large, "ic_PlaceholderWhite")
                Spacer()
                CKIconButton(.tertiary, .medium, "ic_PlaceholderWhite")
                Spacer()
                CKIconButton(.tertiary, .small, "ic_PlaceholderWhite")
            }
            HStack {
                CKIconButton(.tertiary, .extraLarge, "ic_PlaceholderWhite", true)
                Spacer()
                CKIconButton(.tertiary, .large, "ic_PlaceholderWhite", true)
                Spacer()
                CKIconButton(.tertiary, .medium, "ic_PlaceholderWhite", true)
                Spacer()
                CKIconButton(.tertiary, .small, "ic_PlaceholderWhite", true)
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
