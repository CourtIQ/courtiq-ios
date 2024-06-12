//
//  RDToggleView.swift
//  
//
//  Created by DynamicLayers on 10/11/2023.
//

import SwiftUI

@available(iOS 14.0, *)
public struct RDToggleView: View {
    
    @Binding var isOn: Bool
    
    public init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }
    
    public var body: some View {
        Toggle(isOn: $isOn) {
            EmptyView()
        }
        .toggleStyle(SwitchToggleStyle(tint: Color.purple500))
        .frame(width: 60)
    }
}
