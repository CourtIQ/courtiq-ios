//
//  SearchListProfileItem.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-08.
//

import Foundation
import RDDesignSystem
import SwiftUI

struct SearchListProfileItem: View {
    
    let imageUrl: String?
    let name: String
    let gender: String
    let country: String
    let age: String
    let action: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            AvatarImage(size: .medium, url: imageUrl)
            HStack(alignment: .top){
                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .rdBodyBold()
                        .foregroundStyle(Color.TokenColor.Semantic.Text.default)
                    HStack(spacing: 4) {
                        Text(CountryManager.shared.getCountryFlag(fromCode: country) ?? "🏳️")
                            .rdSmallBody()
                        
                        Text(gender)
                            .rdSmallBody()
                        
                        Text("|")
                            .rdSmallBody()
                        
                        Text("Age: \(age)")
                            .rdSmallBody()
                    }
                    .foregroundStyle(Color.TokenColor.Semantic.Text.primary)
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.TokenColor.Semantic.Border.default, lineWidth: 1)
        }
        .padding(1)
    }
}

