//
//  RDAvatarSizing.swift
//  Design System
//
//  Created by Pranav Suri on 05/11/2023.
//

import SwiftUI

// MARK: - RDAvatarSizing
public enum RDAvatarSizing: CGFloat {
    /// Extra small spacing
    case extraSmall = 4
    /// Small spacing
    case small = 8
    /// Medium spacing
    case medium = 12
    /// Large spacing
    case large = 16
    
    /// Badge size for avatar
    var badgeSize: CGFloat {
        switch self {
        case .extraSmall:
            return 12
        case .small:
            return 14
        case .medium:
            return 16
        case .large:
            return 18
        }
    }
    
    /// Badge text size
    var badgeTextSize: CGFloat {
        switch self {
        case .extraSmall, .small:
            return 8
        case .medium, .large:
            return 12
        }
    }
}

// MARK: - RDAvatarBadgeType
@available(iOS 13.0.0, *)
public enum RDAvatarBadgeType: Equatable {
    case online
    case offline
    case notificationIndicator
    case notificationIndicatorWith(count: Int)
    case notificationIndicatorWithIcon(icon: String)
    case none
    
    var bgColor: Color {
        switch self {
        case .online,
                .notificationIndicator,
                .notificationIndicatorWith,
                .notificationIndicatorWithIcon,
                .none:
            return .green500
        case .offline:
            return .grey200
        }
    }
}

// MARK: - RDAvatarBadgeView
@available(iOS 15.0.0, *)
public struct RDAvatarBadgeView: View {
    
    var rdAvatarSizing: RDAvatarSizing
    var rdAvatarBadgeType: RDAvatarBadgeType
    
    public init(
        rdAvatarSizing: RDAvatarSizing,
        rdAvatarBadgeType: RDAvatarBadgeType
    ) {
        self.rdAvatarSizing = rdAvatarSizing
        self.rdAvatarBadgeType = rdAvatarBadgeType
    }
    
    public var body: some View {
        Circle()
            .fill(rdAvatarBadgeType.bgColor)
            .frame(width: rdAvatarSizing.badgeSize, height: rdAvatarSizing.badgeSize)
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 2)
            }
            .overlay {
                switch rdAvatarBadgeType {
                case .notificationIndicator:
                    Circle()
                        .fill(.white)
                        .frame(width: rdAvatarSizing.badgeSize / 4, height: rdAvatarSizing.badgeSize / 4)
                case .notificationIndicatorWith(let count):
                    Text("\(count)")
                        .foregroundColor(.white)
                        .font(.system(size: rdAvatarSizing.badgeTextSize, weight: .bold))
                case .notificationIndicatorWithIcon(icon: let icon):
                    Image(icon)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(width: rdAvatarSizing.badgeSize - 8, height: rdAvatarSizing.badgeSize - 8)
                default: Text("")
                }
            }
    }
}

// MARK: - RDAvatarView
@available(iOS 15.0.0, *)
public struct RDAvatarView: View {
    
    var rdAvatarSizing: RDAvatarSizing
    var rdAvatarBadgeType: RDAvatarBadgeType
    var action: (() -> ())?
    
    public init(
        rdAvatarSizing: RDAvatarSizing = .large,
        rdAvatarBadgeType: RDAvatarBadgeType = .online,
        action: (() -> ())? = nil
    ) {
        self.rdAvatarSizing = rdAvatarSizing
        self.rdAvatarBadgeType = rdAvatarBadgeType
        self.action = action
    }
    
    public var body: some View {
        Image(uiImage: UIImage(named: "ic_User", in: .module, with: nil)!)
            .resizable()
            .frame(width: 24, height: 24)
            .padding(rdAvatarSizing.rawValue)
            .overlay {
                Circle()
                    .stroke(Color.grey200)
            }
            .overlay(alignment: .bottomTrailing) {
                if rdAvatarBadgeType != RDAvatarBadgeType.none {
                    RDAvatarBadgeView(
                        rdAvatarSizing: rdAvatarSizing,
                        rdAvatarBadgeType: rdAvatarBadgeType
                    )
                    .offset(x: 3, y: 3)
                }
            }
            .onTapGesture {
                action?()
            }
    }
}
