//
//  AvatarComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 09/11/2023.
//

import SwiftUI
import DynamicLayers

struct AvatarComponent: View {
    var body: some View {
        
        VStack {
            HStack {
                CKAvatarView(ckAvatarSizing: .large, ckAvatarBadgeType: .none)
                Spacer()
                CKAvatarView(ckAvatarSizing: .medium, ckAvatarBadgeType: .none)
                Spacer()
                CKAvatarView(ckAvatarSizing: .small, ckAvatarBadgeType: .none)
                Spacer()
                CKAvatarView(ckAvatarSizing: .extraSmall, ckAvatarBadgeType: .none)
            }
            
            HStack {
                CKAvatarView(ckAvatarSizing: .large, ckAvatarBadgeType: .online)
                Spacer()
                CKAvatarView(ckAvatarSizing: .medium, ckAvatarBadgeType: .online)
                Spacer()
                CKAvatarView(ckAvatarSizing: .small, ckAvatarBadgeType: .online)
                Spacer()
                CKAvatarView(ckAvatarSizing: .extraSmall, ckAvatarBadgeType: .online)
            }
            
            HStack {
                CKAvatarView(ckAvatarSizing: .large, ckAvatarBadgeType: .offline)
                Spacer()
                CKAvatarView(ckAvatarSizing: .medium, ckAvatarBadgeType: .offline)
                Spacer()
                CKAvatarView(ckAvatarSizing: .small, ckAvatarBadgeType: .offline)
                Spacer()
                CKAvatarView(ckAvatarSizing: .extraSmall, ckAvatarBadgeType: .offline)
            }
            
            HStack {
                CKAvatarView(ckAvatarSizing: .large, ckAvatarBadgeType: .notificationIndicator)
                Spacer()
                CKAvatarView(ckAvatarSizing: .medium, ckAvatarBadgeType: .notificationIndicator)
                Spacer()
                CKAvatarView(ckAvatarSizing: .small, ckAvatarBadgeType: .notificationIndicator)
                Spacer()
                CKAvatarView(ckAvatarSizing: .extraSmall, ckAvatarBadgeType: .notificationIndicator)
            }
            
            HStack {
                CKAvatarView(ckAvatarSizing: .large, ckAvatarBadgeType: .notificationIndicatorWith(count: 2))
                Spacer()
                CKAvatarView(ckAvatarSizing: .medium, ckAvatarBadgeType: .notificationIndicatorWith(count: 2))
                Spacer()
                CKAvatarView(ckAvatarSizing: .small, ckAvatarBadgeType: .notificationIndicatorWith(count: 2))
                Spacer()
                CKAvatarView(ckAvatarSizing: .extraSmall, ckAvatarBadgeType: .notificationIndicatorWith(count: 2))
            }
            
            HStack {
                CKAvatarView(ckAvatarSizing: .large, ckAvatarBadgeType: .notificationIndicatorWithIcon(icon: "ic_Camera"))
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
