//
//  AuthenticationPage.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-15.
//

import SwiftUI
import RDDesignSystem

struct AuthenticationPage<Header: View, Footer: View, Content: View>: View {
    let header: Header
    let footer: Footer
    let content: Content

    private let verticalPadding: CGFloat = 8
    private let horizontalPadding: CGFloat = 16

    init(@ViewBuilder header: () -> Header,
         @ViewBuilder footer: () -> Footer,
         @ViewBuilder content: () -> Content) {
        self.header = header()
        self.footer = footer()
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

            footer
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
        }
        .toolbar(.hidden, for: .navigationBar)
        .background(Color.TokenColor.Semantic.Background.appBackground)

    }
    
}

struct AuthenticationPage_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationPage {
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
        } footer: {
            // Footer
            Text("Need help? Contact support.")
                .font(.footnote)
                .foregroundColor(.blue)
        } content: {
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
        }
    }
}
