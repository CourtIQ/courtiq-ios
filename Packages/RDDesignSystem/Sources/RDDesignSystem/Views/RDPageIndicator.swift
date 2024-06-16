//
//  RDPageIndicator.swift
//
//
//  Created by Pranav Suri on 06/12/2024.
//

import SwiftUI

// MARK: - RDPageIndicator

@available(iOS 13.0, *)
public struct RDPageIndicator: View {
    
    var pageCount: Int
    @Binding var selectedIndex: Int
    var bgColor: Color = .black
    
    public init(pageCount: Int, selectedIndex: Binding<Int>, bgColor: Color = .black) {
        self.pageCount = pageCount
        self._selectedIndex = selectedIndex
        self.bgColor = bgColor
    }
    
    public var body: some View {
        HStack(spacing: 8) {
            ForEach((0..<pageCount), id: \.self) { index in
                Button {
                    withAnimation {
                        selectedIndex = index
                    }
                } label: {
                    Circle()
                        .fill(bgColor)
                        .frame(width: 8, height: 8)
                        .opacity(selectedIndex == index ? 1 : 0.4)
                }
            }
        }
    }
}
