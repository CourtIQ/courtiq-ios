//
//  CKTooltipView.swift
//
//
//  Created by DynamicLayers on 29/11/2023.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CKTooltipView: View {
    
    var type: CKCoachMarkType
    var title: String
    var size: (width: CGFloat, height: CGFloat)
    var padding: EdgeInsets
    
    public init(
        type: CKCoachMarkType = .bottom,
        title: String,
        size: (width: CGFloat, height: CGFloat) = (130, 52),
        padding: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)
    ) {
        self.type = type
        self.title = title
        self.size = size
        self.padding = padding
    }
    
    public var body: some View {
        ZStack {
            PopupBubbleShape(cornerRadius: 8, arrowEdge: type.arrowEdge)
                .foregroundColor(.platinum950)
            
            Text(title)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.white)
                .padding(padding)
        }
        .frame(width: size.width, height: size.height)
    }
}
