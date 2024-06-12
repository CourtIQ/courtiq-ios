//
//  NotificationComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 09/11/2023.
//

import SwiftUI
import DynamicLayers

struct NotificationComponent: View {
    var body: some View {
        VStack(alignment: .leading) {
            CKNotificationView(
                title: "Headline", description:
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
                notificationType: .success
            )
            
            CKNotificationView(
                title: "Headline", description:
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
                notificationType: .error
            )
            
            CKNotificationView(
                title: "Headline", description:
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
                notificationType: .warning
            )
            
            CKNotificationView(
                title: "Headline", description:
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
                notificationType: .info
            )
            
            Spacer()
        }
        .navigationTitle("Notification")
        .padding()
    }
}

struct NotificationComponent_Previews: PreviewProvider {
    static var previews: some View {
        NotificationComponent()
    }
}
