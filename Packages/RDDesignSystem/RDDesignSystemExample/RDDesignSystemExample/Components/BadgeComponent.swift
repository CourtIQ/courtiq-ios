//
//  BadgeComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 09/11/2023.
//

import SwiftUI
import RDDesignSystem

struct BadgeComponent: View {
    var body: some View {
        VStack(alignment: .leading) {
            RDBadgeView(value: "Value", rdBadgeType: .defalt)
            RDBadgeView(value: "Value", rdBadgeType: .success)
            RDBadgeView(value: "Value", rdBadgeType: .error)
            RDBadgeView(value: "Value", rdBadgeType: .new)
            Spacer()
        }
        .navigationTitle("Badge")
        .padding()
    }
}

struct BadgeComponent_Previews: PreviewProvider {
    static var previews: some View {
        BadgeComponent()
    }
}
