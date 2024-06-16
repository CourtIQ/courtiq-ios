//
//  PageIndicatorComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 10/11/2023.
//

import SwiftUI
import RDDesignSystem

struct PageIndicatorComponent: View {
    var body: some View {
        VStack(spacing: 20) {
            RDPageIndicator(pageCount: 15, selectedIndex: .constant(0), bgColor: .black)
            RDPageIndicator(pageCount: 15, selectedIndex: .constant(6), bgColor: .gray)
            RDPageIndicator(pageCount: 15, selectedIndex: .constant(2), bgColor: .red)
            RDPageIndicator(pageCount: 15, selectedIndex: .constant(3), bgColor: .green)
            RDPageIndicator(pageCount: 15, selectedIndex: .constant(4), bgColor: .blue)
            RDPageIndicator(pageCount: 15, selectedIndex: .constant(5), bgColor: .orange)
            
            Spacer()
        }
        .navigationTitle("Page Indicator")
        .padding()
    }
}

struct PageIndicatorComponent_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicatorComponent()
    }
}
