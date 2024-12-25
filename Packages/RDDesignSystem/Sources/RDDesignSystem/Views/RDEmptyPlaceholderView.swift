//
//  RDEmptyPlaceholderView.swift
//  RDDesignSystem
//
//  Created by Pranav Suri on 2024-12-25.
//

import SwiftUI

public struct RDEmptyPlaceholderView: View {
    // MARK: - Private Properties
    private let title: String
    private let subtitle: String
    private let image: Image
    
    // MARK: - Public Initializer
    public init(title: String, subtitle: String, image: Image) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
    
    // MARK: - Body
    public var body: some View {
        VStack(spacing: 8) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 400)

            Text(title)
                .rdBodyBold()
                .foregroundStyle(Color.TokenColor.Semantic.Text.primary)
                .lineLimit(1)
                .truncationMode(.tail)
            Text(subtitle)
                .rdBody()
                .foregroundStyle(Color.TokenColor.Semantic.Text.secondary)
                .lineLimit(2)
                .truncationMode(.tail)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
