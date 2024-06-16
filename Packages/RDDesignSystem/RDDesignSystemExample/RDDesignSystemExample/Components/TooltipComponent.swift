//
//  TooltipComponent.swift
//  RDDesignSystemExample
//
//  Created by RDDesignSystem on 29/11/2023.
//

import SwiftUI
import RDDesignSystem

struct TooltipComponent: View {
    
    
    var body: some View {
        VStack(spacing: 40) {
            RDTooltipView(title: "Lorem ipsum")
            
            RDTooltipView(
                type: .leading,
                title: "Lorem ipsum",
                size: (158, 40),
                padding: EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 0)
            )
            
            RDTooltipView(
                type: .trailing,
                title: "Lorem ipsum",
                size: (158, 40),
                padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 12)
            )
            
            RDTooltipView(
                type: .top,
                title: "Lorem ipsum",
                padding: EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0)
            )
        }
        .navigationTitle("Tooltip")
        .padding()
    }
}

#Preview {
    TooltipComponent()
}
