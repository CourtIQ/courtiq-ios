//
//  BadgeComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 09/11/2023.
//

import SwiftUI
import DynamicLayers

struct BadgeComponent: View {
    var body: some View {
        VStack(alignment: .leading) {
            CKBadgeView(value: "Value", ckBadgeType: .defalt)
            CKBadgeView(value: "Value", ckBadgeType: .success)
            CKBadgeView(value: "Value", ckBadgeType: .error)
            CKBadgeView(value: "Value", ckBadgeType: .new)
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
