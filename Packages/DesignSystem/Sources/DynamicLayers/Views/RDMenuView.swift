//
//  RDMenuView.swift
//  
//
//  Created by DynamicLayers on 11/11/2023.
//

import SwiftUI

@available(iOS 14.0, *)
public struct RDMenuView: View {
    
    var items: [AnyView]
    var label: AnyView
    
    public init(items: [AnyView], label: AnyView) {
        self.items = items
        self.label = label
    }
    
    public var body: some View {
        Menu {
            VStack {
                ForEach((0..<items.count), id: \.self) { index in
                    items[index]
                }
            }
        } label: {
            label
        }

    }
}
