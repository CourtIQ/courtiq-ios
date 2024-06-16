//
//  RDNotificationBadgeComponent.swift
//  CraftKitExample
//
//  Created by Muhammad Abbbas on 11/11/2023.
//

import SwiftUI
import RDDesignSystem

struct RDNotificationBadgeComponent: View {
    var body: some View {
        VStack(spacing: 20) {
            RDNotificationBadgeView(type: .small, notiCount: nil)
            RDNotificationBadgeView(type: RDNotificationBadgeType.medium, notiCount: 3)
            RDNotificationBadgeView(type: RDNotificationBadgeType.large, notiCount: 100)
            RDNotificationBadgeView(type: RDNotificationBadgeType.secondary, notiCount: nil)
        }
        .navigationTitle("Notification Badge")
        .padding()
        .background {
            Color
                .gray
        }
    }
}

struct RDNotificationBadge_Previews: PreviewProvider {
    static var previews: some View {
        RDNotificationBadgeComponent()
    }
}
