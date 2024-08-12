//
//  RDToggle.swift
//
//
//  Created by Pranav Suri on 13/06/2024.
//

import SwiftUI

@available(iOS 14.0, *)
public struct RDToggle: View {
    
    @Binding var isOn: Bool
    
    public init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }
    
    public var body: some View {
        Toggle(isOn: $isOn) {
            EmptyView()
        }
        .toggleStyle(SwitchToggleStyle(tint: Color.TokenColor.Semantic.Icon.secondary))
        .frame(width: 60)
    }
}
