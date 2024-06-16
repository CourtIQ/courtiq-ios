//
//  CoachMarkComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 10/11/2023.
//

import SwiftUI
import RDDesignSystem

struct CoachMarkComponent: View {
    var items: [RDCoachMarkItem] = [
        RDCoachMarkItem(title: "Headline 1", description: "1 Pack my box with five dozen liquor jugs. How vexingly quick draft."),
        RDCoachMarkItem(title: "Headline 2", description: "2 Pack my box with five dozen liquor jugs. How vexingly quick draft."),
        RDCoachMarkItem(title: "Headline 3", description: "3 Pack my box with five dozen liquor jugs. How vexingly quick draft."),
        RDCoachMarkItem(title: "Headline 4", description: "4 Pack my box with five dozen liquor jugs. How vexingly quick draft."),
        RDCoachMarkItem(title: "Headline 5", description: "5 Pack my box with five dozen liquor jugs. How vexingly quick draft.")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                RDCoachMarkView(items: items) { }
                RDCoachMarkView(items: items, type: .leading) { }
                RDCoachMarkView(items: items, type: .trailing) { }
                RDCoachMarkView(items: items, type: .top) { }
                
                Spacer()
            }
            .navigationTitle("Coach Mark")
            .padding()
        }
    }
}

struct CoachMarkComponent_Previews: PreviewProvider {
    static var previews: some View {
        CoachMarkComponent()
    }
}
