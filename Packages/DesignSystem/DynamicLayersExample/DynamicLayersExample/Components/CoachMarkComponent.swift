//
//  CoachMarkComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 10/11/2023.
//

import SwiftUI
import DynamicLayers

struct CoachMarkComponent: View {
    var items: [CKCoachMarkItem] = [
        CKCoachMarkItem(title: "Headline 1", description: "1 Pack my box with five dozen liquor jugs. How vexingly quick draft."),
        CKCoachMarkItem(title: "Headline 2", description: "2 Pack my box with five dozen liquor jugs. How vexingly quick draft."),
        CKCoachMarkItem(title: "Headline 3", description: "3 Pack my box with five dozen liquor jugs. How vexingly quick draft."),
        CKCoachMarkItem(title: "Headline 4", description: "4 Pack my box with five dozen liquor jugs. How vexingly quick draft."),
        CKCoachMarkItem(title: "Headline 5", description: "5 Pack my box with five dozen liquor jugs. How vexingly quick draft.")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CKCoachMarkView(items: items) { }
                CKCoachMarkView(items: items, type: .leading) { }
                CKCoachMarkView(items: items, type: .trailing) { }
                CKCoachMarkView(items: items, type: .top) { }
                
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
