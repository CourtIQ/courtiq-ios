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
    private let type: RDPageIndicatorType
    @Binding var selectedIndex: Int
    
    public init(type: RDPageIndicatorType = .circle,
                pageCount: Int,
                selectedIndex: Binding<Int>) {
        self.type = type
        self.pageCount = pageCount
        self._selectedIndex = selectedIndex
    }
    
    public var body: some View {
        HStack(spacing: 8) {
            ForEach((0..<pageCount), id: \.self) { index in
                Button {
                    withAnimation {
                        selectedIndex = index
                    }
                } label: {
                    switch type {
                    case .circle:
                        Circle()
                            .fill(selectedIndex == index
                                  ? type.selectedIndicatorColor
                                  : type.indicatorColor)
                            .frame(width: 8, height: 8)
                            .opacity(selectedIndex == index ? 1 : 0.4)
                    case .capsule:
                        Capsule()
                            .fill(selectedIndex == index
                                  ? type.selectedIndicatorColor
                                  : type.indicatorColor)
                            .frame(width: 30, height: 8)
                            .opacity(selectedIndex == index ? 1 : 0.4)
                    }

                }
            }
        }
    }
}

public enum RDPageIndicatorType {
    case circle
    case capsule
    
    var indicatorColor: Color {
        switch self {
        case .capsule, .circle:
            Color.TokenColor.Semantic.Icon.secondary
        }
    }
    
    var selectedIndicatorColor: Color {
        switch self {
        case .capsule, .circle:
            Color.TokenColor.Semantic.Icon.primary
        }
    }
}
