//
//  CKMessageComponent.swift
//  CraftKitExample
//
//  Created by DynamicLayers on 11/11/2023.
//

import SwiftUI
import DynamicLayers

struct CKMessageComponent: View {
    var body: some View {
        VStack(spacing: 20) {
            CKMessageView(
                message: CKMessage(
                    message: "Hi want to book some desk, is it possible?",
                    date: "3:00 PM",
                    image: ""
                )
            )

            CKMessageView(
                type: .receiver,
                message: CKMessage(
                    message: "Hi want to book some desk, is it possible?",
                    date: "3:00 PM",
                    image: ""
                )
            )
            
            Spacer()
        }
        .navigationTitle("Toggle")
        .padding()
    }
}

struct CKMessageComponent_Previews: PreviewProvider {
    static var previews: some View {
        CKMessageComponent()
    }
}
