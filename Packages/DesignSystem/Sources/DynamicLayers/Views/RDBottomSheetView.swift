//
//  RDBottomSheetView.swift
//  
//
//  Created by DynamicLayers on 09/11/2023.
//

import SwiftUI

public enum RDBottomSheetType {
    case primary
    case secondary
    case tertiary
    case quaternary
}

@available(iOS 15.0.0, *)
public struct RDBottomSheetView: View {
    
    var type: RDBottomSheetType
    var image: String
    var title: String
    var headline: String
    var description: String
    var buttonTitles: (leading: String, trailing: String)
    var onSave: (()->())?
    var onCancel: (()->())?
    
    public init(
        type: RDBottomSheetType,
        image: String,
        title: String,
        headline: String,
        description: String,
        buttonTitles: (leading: String, trailing: String) = ("Cancel", "Save"),
        onSave: (() -> ())? = nil,
        onCancel: (() -> ())? = nil
    ) {
        self.type = type
        self.image = image
        self.title = title
        self.headline = headline
        self.description = description
        self.buttonTitles = buttonTitles
        self.onSave = onSave
        self.onCancel = onCancel
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            
            RoundedRectangle(cornerRadius: 3)
                .fill(Color.grey200)
                .frame(width: 40, height: 5)
                .padding(.vertical, 16)
            
            Text(title)
                .font(.system(size: 16, weight: .bold))
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(8)
                .padding(.top, 16)
                .padding(.bottom, 32)
            
            Text(headline)
                .font(.system(size: 20, weight: .bold))
                .padding(.bottom, 8)
            
            Text(description)
                .foregroundColor(.grey500)
                .font(.system(size: 16, weight: .regular))
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .frame(height: 72)
            
            if type == .secondary || type == .quaternary {
                RDButtonView(
                    .extraLarge,
                    .primary,
                    buttonTitles.trailing
                )
                .padding(.top, 16)
            }
            
            if type == .secondary {
                RDButtonView(
                    .extraLarge,
                    .tertiary,
                    buttonTitles.leading
                )
                .padding(.top, 16)
            }
            
            if type == .tertiary {
                HStack(spacing: 16) {
                    RDButtonView(
                        .extraLarge,
                        .ghost,
                        buttonTitles.leading
                    )
                    
                    RDButtonView(
                        .extraLarge,
                        .primary,
                        buttonTitles.trailing
                    )
                }
                .padding(.top, 16)
            }
            
            Spacer()
            
        }
        .padding(.horizontal, 16)
    }
}
