//
//  CardComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 10/11/2023.
//

import SwiftUI
import RDDesignSystem

struct CardComponent: View {
    
    var body: some View {
        VStack(spacing: 20) {
            RDCardView(type: .small, image: "ic_ImagePlaceholder", title: "Title", description: "This is the Description")
                .frame(width: 230)
            
            RDCardView(type: .medium, image: "ic_ImagePlaceholder", title: "Title", description: "This is the Description")
                .frame(width: 180)
            
            RDCardView(type: .large, image: "ic_ImagePlaceholder", title: "Title", description: "This is the Description")
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
