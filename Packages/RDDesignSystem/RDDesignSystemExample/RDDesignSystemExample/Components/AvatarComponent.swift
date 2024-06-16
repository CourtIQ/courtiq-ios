//
//  AvatarComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 09/11/2023.
//

import SwiftUI
import RDDesignSystem

struct AvatarComponent: View {
    var body: some View {
        
        VStack {
            HStack {
                RDAvatarView(rdAvatarSizing: .large, rdAvatarBadgeType: .none)
                Spacer()
                RDAvatarView(rdAvatarSizing: .medium, rdAvatarBadgeType: .none)
                Spacer()
                RDAvatarView(rdAvatarSizing: .small, rdAvatarBadgeType: .none)
                Spacer()
                RDAvatarView(rdAvatarSizing: .extraSmall, rdAvatarBadgeType: .none)
            }
            
            HStack {
                RDAvatarView(rdAvatarSizing: .large, rdAvatarBadgeType: .online)
                Spacer()
                RDAvatarView(rdAvatarSizing: .medium, rdAvatarBadgeType: .online)
                Spacer()
                RDAvatarView(rdAvatarSizing: .small, rdAvatarBadgeType: .online)
                Spacer()
                RDAvatarView(rdAvatarSizing: .extraSmall, rdAvatarBadgeType: .online)
            }
            
            HStack {
                RDAvatarView(rdAvatarSizing: .large, rdAvatarBadgeType: .offline)
                Spacer()
                RDAvatarView(rdAvatarSizing: .medium, rdAvatarBadgeType: .offline)
                Spacer()
                RDAvatarView(rdAvatarSizing: .small, rdAvatarBadgeType: .offline)
                Spacer()
                RDAvatarView(rdAvatarSizing: .extraSmall, rdAvatarBadgeType: .offline)
            }
            
            HStack {
                RDAvatarView(rdAvatarSizing: .large, rdAvatarBadgeType: .notificationIndicator)
                Spacer()
                RDAvatarView(rdAvatarSizing: .medium, rdAvatarBadgeType: .notificationIndicator)
                Spacer()
                RDAvatarView(rdAvatarSizing: .small, rdAvatarBadgeType: .notificationIndicator)
                Spacer()
                RDAvatarView(rdAvatarSizing: .extraSmall, rdAvatarBadgeType: .notificationIndicator)
            }
            
            HStack {
                RDAvatarView(rdAvatarSizing: .large, rdAvatarBadgeType: .notificationIndicatorWith(count: 2))
                Spacer()
                RDAvatarView(rdAvatarSizing: .medium, rdAvatarBadgeType: .notificationIndicatorWith(count: 2))
                Spacer()
                RDAvatarView(rdAvatarSizing: .small, rdAvatarBadgeType: .notificationIndicatorWith(count: 2))
                Spacer()
                RDAvatarView(rdAvatarSizing: .extraSmall, rdAvatarBadgeType: .notificationIndicatorWith(count: 2))
            }
            
            HStack {
                RDAvatarView(rdAvatarSizing: .large, rdAvatarBadgeType: .notificationIndicatorWithIcon(icon: "ic_Camera"))
                Spacer()
            }
            
            Spacer()
        }
        .navigationTitle("Avatar")
        .padding()
    }
}

struct AvatarComponent_Previews: PreviewProvider {
    static var previews: some View {
        AvatarComponent()
    }
}
