//
//  CKNotificationView.swift
//  
//
//  Created by DynamicLayers on 05/11/2023.
//

import SwiftUI

public enum CKNotificationType {
    case error
    case warning
    case info
    case success
    
    var leadingIcon: String {
        switch self {
        case .error:
            return "ic_NotiErrorCircle"
        case .warning:
            return "ic_NotiWarningTriangle"
        case .info:
            return "ic_NotiInfoCircle"
        case .success:
            return "ic_NotiCheckCircle"
        }
    }
    
    @available(iOS 13.0.0, *)
    var bgColor: Color {
        switch self {
        case .error:
            return .red50
        case .warning:
            return .yellow50
        case .info:
            return .purple50
        case .success:
            return .green50
        }
    }
}

@available(iOS 13.0.0, *)
public struct CKNotificationView: View {
    
    let title: String
    let description: String
    var notificationType: CKNotificationType
    var isHideCloseBtn: Bool
    var titleFont: Font
    var descriptionFont: Font
    var onHideAction: (()->())?
    
    public init(
        title: String,
        description: String,
        notificationType: CKNotificationType = .error,
        isHideCloseBtn: Bool = false,
        titleFont: Font = .system(size: 16, weight: .bold),
        descriptionFont: Font = .system(size: 14, weight: .regular),
        onHideAction: (()->())? = nil
    ) {
        self.title = title
        self.description = description
        self.notificationType = notificationType
        self.isHideCloseBtn = isHideCloseBtn
        self.titleFont = titleFont
        self.descriptionFont = descriptionFont
        self.onHideAction = onHideAction
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(uiImage: UIImage(named: notificationType.leadingIcon, in: .module, with: nil)!)
                .resizable()
                .frame(width: 24, height: 24)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(titleFont)
                
                Text(description)
                    .lineLimit(2)
                    .font(descriptionFont)
            }
            
            Spacer()
            
            if !isHideCloseBtn {
                Image(uiImage: UIImage(named: "ic_XMarkCircle", in: .module, with: nil)!)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        onHideAction?()
                    }
            }
            
        }
        .padding(16)
        .background(notificationType.bgColor)
        .cornerRadius(12)
    }
}
