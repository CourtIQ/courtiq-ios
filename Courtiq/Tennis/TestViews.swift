//
//  TestViews.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-31.
//

import SwiftUI
import RDDesignSystem

struct TestViews: View {
    @State var value: Int = 0
    var body: some View {
        MarqueeView {
            Text("Test")
        } footer: {
            EmptyView()
        } content: {
            ForEach(RDNumberInput.State.allCases) { state in
                RDNumberInput(placeholder: "Test", value: $value
                              , range: 0...10, layout: .verticalLeading, state: state)
            }
        }
    }
}

#Preview {
    TestViews()
}
