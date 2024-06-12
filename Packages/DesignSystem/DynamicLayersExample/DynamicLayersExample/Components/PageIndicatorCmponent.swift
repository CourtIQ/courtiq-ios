//
//  PageIndicatorComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 10/11/2023.
//

import SwiftUI
import DynamicLayers

struct PageIndicatorComponent: View {
    var body: some View {
        VStack(spacing: 20) {
            CKPageIndicator(pageCount: 15, selectedIndex: .constant(0), bgColor: .black)
            CKPageIndicator(pageCount: 15, selectedIndex: .constant(6), bgColor: .gray)
            CKPageIndicator(pageCount: 15, selectedIndex: .constant(2), bgColor: .red)
            CKPageIndicator(pageCount: 15, selectedIndex: .constant(3), bgColor: .green)
            CKPageIndicator(pageCount: 15, selectedIndex: .constant(4), bgColor: .blue)
            CKPageIndicator(pageCount: 15, selectedIndex: .constant(5), bgColor: .orange)
            
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
