//
//  RDLineItemComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 10/11/2023.
//

import SwiftUI
import RDDesignSystem

struct RDLineItemComponent: View {
    
    @State var isOn = false
    
    var body: some View {
        VStack(spacing: 20) {
            RDLineItemView(type: .primary, leadingTitleDescription: (title: "Heading", desc: "Description"), isOn: $isOn, leadingImage: "ic_PlaceholderBlack") {

            }

            RDLineItemView(type: .secondary, leadingTitleDescription: (title: "Heading", desc: "Description"), trailingTitleDescription: (title: "Heading", desc: nil), isOn: $isOn, leadingImage: "ic_PlaceholderBlack") {

            }

            RDLineItemView(type: .tertiary, leadingTitleDescription: (title: "Heading", desc: "Description"), trailingTitleDescription: (title: "Heading", desc: "Description"), isOn: $isOn, leadingImage: "ic_PlaceholderBlack") {

            }

            RDLineItemView(type: .trailingAddButton, leadingTitleDescription: (title: "Heading", desc: "Description"), isOn: $isOn, leadingImage: "ic_PlaceholderBlack") {

            }

            RDLineItemView(type: .trailingToggle, leadingTitleDescription: (title: "Heading", desc: "Description"), isOn: $isOn, leadingImage: "ic_PlaceholderBlack") {

            }
            
            Spacer()
        }
        .navigationTitle("Line Item")
        .padding()
    }
}

struct RDLineItemComponent_Previews: PreviewProvider {
    static var previews: some View {
        RDLineItemComponent()
    }
}
