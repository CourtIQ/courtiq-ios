//
//  SwiftUIView.swift
//  
//
//  Created by Pranav Suri on 2024-08-09.
//

import SwiftUI

// MARK: - Avatar

public struct AvatarImage: View {
    
    // MARK: - Enums
    public enum AvatarSize {
        case small, medium, large, extraLarge
        
        public var value: CGFloat {
            switch self {
            case .small:
                return 32
            case .medium:
                return 48
            case .large:
                return 64
            case .extraLarge:
                return 96
            }
        }
    }
    
    // MARK: - Lifecycle
    
    public init(size: AvatarSize,
                url: String?
    ) {
        self.size = size
        self.url = URL(string: url ?? "")
    }
    
    // MARK: - Internal
    
    public var body: some View {
        if let url = url {
            CachedAsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.value, height: size.value)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.TokenColor.Semantic.Border.secondary, lineWidth: 1)
                    )
            } placeholder: {
                ProgressView()
                    .frame(width: size.value, height: size.value)
                    .overlay {
                        Circle()
                            .stroke(Color.TokenColor.Semantic.Border.secondary, lineWidth: 1)
                            .frame(width: size.value, height: size.value)
                    }
            }
        } else {
            Circle()
                .stroke(Color.TokenColor.Semantic.Border.secondary, lineWidth: 1)
                .frame(width: size.value, height: size.value)
                .overlay(
                    Image.Token.Icons.person
                        .resizable()
                        .frame(width: size.value/2, height: size.value/2)
                )
        }
    }
    
    // MARK: - Private
    
    private let size: AvatarSize
    private var url: URL?
}



#Preview {
    AvatarImage(size: .small, url: "https://www.example.com/image.png")
}
