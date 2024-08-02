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
    private let verticalSpacing: CGFloat = 8
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

            Spacer()

            footer
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
        }
        .toolbar(.hidden, for: .navigationBar)
        .background(Color.TokenColor.Semantic.Background.default)
    }
}

struct AuthenticationPage_Previews: PreviewProvider {
    static var previews: some View {
        MarqueeView(
            header: {
                // Header
                HStack {
                    Text("Custom Navigation Bar")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
            },
            content: {
                // Custom content
                VStack(spacing: 20) {
                    TextField("Email", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Login") {
                        // Action
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            },
            footer: {
                // Footer
                Text("Need help? Contact support.")
                    .font(.footnote)
                    .foregroundColor(.blue)
            }
        )
    }
}
