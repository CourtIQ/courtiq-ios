//
//  RDToggleComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 10/11/2023.
//

import SwiftUI
import RDDesignSystem

struct RDToggleComponent: View {
    
    @State var isOn1 = false
    @State var isOn2 = true
    
    var body: some View {
        VStack(spacing: 20) {
            RDToggleView(isOn: $isOn1)
            RDToggleView(isOn: $isOn2)
        }
        .navigationTitle("Toggle")
        .padding()
    }
}

struct RDToggleComponent_Previews: PreviewProvider {
    static var previews: some View {
        RDToggleComponent()
    }
}
