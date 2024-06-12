//
//  CardComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 10/11/2023.
//

import SwiftUI
import DynamicLayers

struct CardComponent: View {
    
    var body: some View {
        VStack(spacing: 20) {
            CKCardView(type: .small, image: "ic_ImagePlaceholder", title: "Title", description: "This is the Description")
                .frame(width: 230)
            
            CKCardView(type: .medium, image: "ic_ImagePlaceholder", title: "Title", description: "This is the Description")
                .frame(width: 180)
            
            CKCardView(type: .large, image: "ic_ImagePlaceholder", title: "Title", description: "This is the Description")
                .frame(width: 200)
            
            Spacer()
        }
        .navigationTitle("Card")
        .padding()
    }
}

struct CardComponent_Previews: PreviewProvider {
    static var previews: some View {
        CardComponent()
    }
}
