//
//  CKCardView.swift
//  
//
//  Created by DynamicLayers on 09/11/2023.
//

import SwiftUI

@available(iOS 13.0.0, *)
public enum CKCardType {
    case small
    case medium
    case large
    
    var alignment: HorizontalAlignment {
        switch self {
        case .medium:
            return .leading
        default:
            return .center
        }
    }
    
    var verticalPadding: CGFloat {
        switch self {
        case .large:
            return 16
        default:
            return 12
        }
    }
    
    var minWidth: CGFloat {
        switch self {
        case .large:
            return 200
        case .medium:
            return 150
        default:
            return 0
        }
    }
}

@available(iOS 15.0.0, *)
public struct CKCardView: View {
    
    var type: CKCardType = .large
    var image: String
    var title: String
    var description: String
    
    public init(type: CKCardType, image: String, title: String, description: String) {
        self.type = type
        self.image = image
        self.title = title
        self.description = description
    }
    
    public var body: some View {
        VStack(alignment: type.alignment, spacing: 16) {
            HStack {
                
                if type == .large {
                    Spacer()
                }
                
                Image(image)
                    .resizable()
                    .frame(width: 40, height: 40)
                
                if type == .small {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .foregroundColor(.platinum950)
                            .font(.system(size: 14, weight: .bold))
                        Text(description)
                            .foregroundColor(.platinum500)
                            .font(.system(size: 14, weight: .regular))
                            .lineLimit(1)
                    }
                }
                
                Spacer()
            }
            
            if type != .small {
                VStack(alignment: type.alignment, spacing: 4) {
                    Text(title)
                        .foregroundColor(.platinum950)
                        .font(.system(size: 14, weight: .bold))
                    Text(description)
                        .foregroundColor(.platinum500)
                        .font(.system(size: 14, weight: .regular))
                        .lineLimit(1)
                }
            }
        }
        .padding(type.verticalPadding)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.chipBorderColor)
        }
    }
}
