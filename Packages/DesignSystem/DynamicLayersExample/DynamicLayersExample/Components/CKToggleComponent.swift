//
//  CKToggleComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 10/11/2023.
//

import SwiftUI
import DynamicLayers

struct CKToggleComponent: View {
    
    @State var isOn1 = false
    @State var isOn2 = true
    
    var body: some View {
        VStack(spacing: 20) {
            CKToggleView(isOn: $isOn1)
            CKToggleView(isOn: $isOn2)
        }
        .navigationTitle("Toggle")
        .padding()
    }
}

struct CKToggleComponent_Previews: PreviewProvider {
    static var previews: some View {
        CKToggleComponent()
    }
}
