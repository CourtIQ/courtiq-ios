//
//  CKLineItemView.swift
//  
//
//  Created by DynamicLayers on 10/11/2023.
//

import SwiftUI

public enum CKLineItemType {
    case primary
    case secondary
    case tertiary
    case trailingAddButton
    case trailingToggle
}

@available(iOS 15.0, *)
public struct CKLineItemView: View {
    
    var type: CKLineItemType = .primary
    var leadingTitleDescription: (title: String, desc: String)
    var trailingTitleDescription: (title: String, desc: String?)?
    @Binding var isOn: Bool
    var leadingImage: String
    
    let action: (()->())
    var onAddPressed: (()->())?
    
    public init(
        type: CKLineItemType,
        leadingTitleDescription: (title: String, desc: String),
        trailingTitleDescription: (title: String, desc: String?)? = nil,
        isOn: Binding<Bool>,
        leadingImage: String,
        action: @escaping () -> Void,
        onAddPressed: (() -> Void)? = nil
    ) {
        self.type = type
        self.leadingTitleDescription = leadingTitleDescription
        self.trailingTitleDescription = trailingTitleDescription
        self._isOn = isOn
        self.leadingImage = leadingImage
        self.action = action
        self.onAddPressed = onAddPressed
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            Image(leadingImage)
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.trailing, 16)
            
            VStack(alignment: .leading) {
                Text(leadingTitleDescription.title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.platinum950)
                
                Text(leadingTitleDescription.desc)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.platinum500)
            }
            
            Spacer()
            
            switch type {
            case .secondary:
                Text(trailingTitleDescription?.title ?? "")
                    .foregroundColor(.platinum950)
                    .font(.system(size: 16, weight: .regular))
            case .tertiary:
                VStack(alignment: .trailing) {
                    Text(trailingTitleDescription?.title ?? "")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.platinum950)
                    
                    Text(trailingTitleDescription?.desc ?? "")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.platinum500)
                }
            case .trailingAddButton:
                CKButtonView(
                    .small,
                    .tertiary,
                    "Add",
                    width: 53
                ){
                    onAddPressed?()
                }
            case .trailingToggle:
                CKToggleView(isOn: $isOn)
            default:
                EmptyView()
            }
            
            switch type {
            case .trailingAddButton,
                    .trailingToggle:
                EmptyView()
            default:
                Image(uiImage: UIImage(named: "ic_ChevronRight", in: .module, with: nil)!)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 16)
            }
        }
        .frame(height: 76)
        .onTapGesture {
            action()
        }
    }
}
