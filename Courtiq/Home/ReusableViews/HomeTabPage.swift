//
//  HomeTabPage.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-15.
//

import SwiftUI
import RDDesignSystem

struct HomeTabPage<Header: View, Content: View>: View {
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
        }
        .background(Color(.systemBackground))
    }
}

struct HomeTabPage_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabPage {
            // Header
            HStack {
                Text("Home Tab")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
        } content: {
            // Custom content
            VStack(spacing: 20) {
                Text("Welcome to the Home Tab")
                    .font(.title)
                Text("Here is some sample content.")
                    .font(.body)
                Button("Click Me") {
                    // Action
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
    }
}
