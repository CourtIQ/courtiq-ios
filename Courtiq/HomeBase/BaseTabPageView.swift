//
//  BaseTabPageView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-08.
//

import SwiftUI

struct BaseTabPageView<Header: View, Content: View>: View {
    let header: Header
    let content: Content

    private let verticalPadding: CGFloat = 8
    private let horizontalPadding: CGFloat = 16

    init(@ViewBuilder header: () -> Header,
         @ViewBuilder content: () -> Content) {
        self.header = header()
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            header
            VStack(spacing: verticalPadding) {
                content
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

            Spacer()
        }
        .background(Color(.systemBackground))
        .toolbar(.hidden, for: .navigationBar)
    }
}
