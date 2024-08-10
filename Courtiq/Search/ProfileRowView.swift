//
//  ProfileRowView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-08.
//

import Foundation
import RDDesignSystem
import SwiftUI

struct ProfileRowView: View {
    
    let imageUrl: String
    let name: String
    let gender: String
    let country: String
    let age: String
    let action: () -> Void
    
    var body: some View {
        RDCardView(type: .primary) {
            HStack(alignment: .center, spacing: 12) {
                AvatarImage(size: .small, url: imageUrl)
                HStack{
                    VStack(alignment: .leading, spacing: 4) {
                        Text(name)
                            .rdBodyBold()
                            .foregroundStyle(Color.TokenColor.Semantic.Text.default)
                        Text(gender)
                            .rdBody()
                            .foregroundStyle(Color.TokenColor.Semantic.Text.primary)
                    }
                    Spacer()
                }
                
                
                Image.Token.Icons.chevronRight
                    .rdActionIcon {
                        action()
                    }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

