//
//  AuthenticationPage.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-15.
//

import SwiftUI
import RDDesignSystem

struct MarqueeView<Header: View, Content: View, Footer: View>: View {
    let header: Header
    let content: Content
    let footer: Footer
    
    private let verticalPadding: CGFloat = 8
    private let verticalSpacing: CGFloat = 12
    private let horizontalPadding: CGFloat = 16
    
    init(
        @ViewBuilder header: () -> Header,
        @ViewBuilder content: () -> Content,
        @ViewBuilder footer: () -> Footer
    ) {
        self.header = header()
        self.content = content()
        self.footer = footer()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            header
            
            VStack(spacing: verticalSpacing) {
                content
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            VStack(spacing: verticalSpacing) {
                footer
                    .padding(.horizontal, horizontalPadding)
                    .padding(.vertical, verticalPadding)
            }
        }
        .background(Color.TokenColor.Semantic.Background.default)
    }
}
