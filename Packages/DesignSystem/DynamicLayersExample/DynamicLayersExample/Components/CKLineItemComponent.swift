//
//  CKLineItemComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 10/11/2023.
//

import SwiftUI
import DynamicLayers

struct CKLineItemComponent: View {
    
    @State var isOn = false
    
    var body: some View {
        VStack(spacing: 20) {
            CKLineItemView(type: .primary, leadingTitleDescription: (title: "Heading", desc: "Description"), isOn: $isOn, leadingImage: "ic_PlaceholderBlack") {

            }

            CKLineItemView(type: .secondary, leadingTitleDescription: (title: "Heading", desc: "Description"), trailingTitleDescription: (title: "Heading", desc: nil), isOn: $isOn, leadingImage: "ic_PlaceholderBlack") {

            }

            CKLineItemView(type: .tertiary, leadingTitleDescription: (title: "Heading", desc: "Description"), trailingTitleDescription: (title: "Heading", desc: "Description"), isOn: $isOn, leadingImage: "ic_PlaceholderBlack") {

            }

            CKLineItemView(type: .trailingAddButton, leadingTitleDescription: (title: "Heading", desc: "Description"), isOn: $isOn, leadingImage: "ic_PlaceholderBlack") {

            }

            CKLineItemView(type: .trailingToggle, leadingTitleDescription: (title: "Heading", desc: "Description"), isOn: $isOn, leadingImage: "ic_PlaceholderBlack") {

            }
            
            Spacer()
        }
        .navigationTitle("Line Item")
        .padding()
    }
}

struct CKLineItemComponent_Previews: PreviewProvider {
    static var previews: some View {
        CKLineItemComponent()
    }
}
