//
//  RDCoachMarkView.swift
//
//
//  Created by Pranav Suri on 06/12/2024.
//

import SwiftUI

// MARK: - RDCoachMarkItem
public struct RDCoachMarkItem {
    let title: String
    let description: String
    
    public init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}

// MARK: - RDCoachMarkType
@available(iOS 13.0, *)
public enum RDCoachMarkType {
    case top
    case leading
    case trailing
    case bottom
    
    var arrowEdge: Edge {
        switch self {
        case .top:
            return .top
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        case .bottom:
            return .bottom
        }
    }
    
    var edgesInsets: EdgeInsets {
        switch self {
        case .leading:
            return EdgeInsets(top: 16, leading: 26, bottom: 16, trailing: 16)
        case .trailing:
            return EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 26)
        case .top:
            return EdgeInsets(top: 26, leading: 16, bottom: 16, trailing: 16)
        case .bottom:
            return EdgeInsets(top: 16, leading: 16, bottom: 26, trailing: 16)
        }
    }
}

// MARK: - RDCoachMarkView
@available(iOS 15.0, *)
public struct RDCoachMarkView: View {
    
    @State var selectedIndex = 0
    
    let items: [RDCoachMarkItem]
    var type: RDCoachMarkType
    let onClose: (() -> ())
    
    public init(items: [RDCoachMarkItem], type: RDCoachMarkType = .bottom, onClose: @escaping (() -> ())) {
        self.items = items
        self.type = type
        self.onClose = onClose
    }
    
    public var body: some View {
        ZStack {
            PopupBubbleShape(cornerRadius: 16, arrowEdge: type.arrowEdge)
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(items[selectedIndex].title)
                        .lineLimit(1)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: "ic_XMarkWhiteCircle", in: .module, with: nil)!)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            onClose()
                        }
                }
                
                Text(items[selectedIndex].description)
                    .lineLimit(2)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .regular))
                    .padding(.bottom, 8)
                
                HStack(spacing: 0) {
//                    RDPageIndicator(pageCount: items.count, selectedIndex: $selectedIndex, bgColor: .white)
                    Spacer()
                    
                    RDButtonView(
                        .small,
                        .tertiary,
                        "Back",
                        width: 59)
                    {
                        if selectedIndex > 0 {
                            withAnimation {
                                selectedIndex -= 1
                            }
                        }
                    }
                    .padding(.trailing, 8)
                    
                    RDButtonView(
                        .small,
                        .primary,
                        "Next step",
                        width: 92
                    ) {
                        if selectedIndex < items.count - 1 {
                            withAnimation {
                                selectedIndex += 1
                            }
                        }
                    }
                    
                }
                
            }
            .padding(type.edgesInsets)
        }
    }
}
