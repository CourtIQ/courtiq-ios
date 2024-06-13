//
//  RDNotificationBadgeView.swift
//
//
//  Created by Pranav Suri on 06/12/2024.
//

import SwiftUI

// MARK: - RDNotificationBadgeType
public enum RDNotificationBadgeType {
    case small
    case medium
    case large
    case secondary
    
    var size: CGFloat {
        switch self {
        case .small:
            return 10
        case .medium,
                .large,
                .secondary:
            return 18
        }
    }
}

// MARK: - RDNotificationBadgeView
@available(iOS 15.0.0, *)
public struct RDNotificationBadgeView: View {
    
    var type: RDNotificationBadgeType
    var notiCount: Int?
    
    public init(
        type: RDNotificationBadgeType = .large,
        notiCount: Int?
    ) {
        self.type = type
        self.notiCount = notiCount
    }
    
    public var body: some View {
        if type == .medium || type == .large {
            if let notiCount {
                Text("\(notiCount)")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .bold))
                    .padding(.horizontal, 4)
                    .frame(minWidth: 18, maxHeight: 18)
                    .background(.red)
                    .cornerRadius(30)
                    .overlay {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.white, lineWidth: 2)
                    }
            }
        } else {
            Circle()
                .fill(.red)
                .frame(width: type.size, height: type.size)
                .overlay {
                    Circle()
                        .stroke(.white, lineWidth: 2)
                }
                .overlay {
                    if type == .secondary {
                        Circle()
                            .fill(.white)
                            .frame(width: 5.33, height: 5.33)
                    }
                }
        }
    }
}
