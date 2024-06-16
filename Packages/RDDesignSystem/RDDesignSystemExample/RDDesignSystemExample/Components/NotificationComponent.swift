//
//  NotificationComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 09/11/2023.
//

import SwiftUI
import RDDesignSystem

struct NotificationComponent: View {
    var body: some View {
        VStack(alignment: .leading) {
            RDNotificationView(
                title: "Headline", description:
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
                notificationType: .success
            )
            
            RDNotificationView(
                title: "Headline", description:
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
                notificationType: .error
            )
            
            RDNotificationView(
                title: "Headline", description:
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
                notificationType: .warning
            )
            
            RDNotificationView(
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
