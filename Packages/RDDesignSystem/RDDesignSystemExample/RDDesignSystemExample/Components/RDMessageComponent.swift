//
//  RDMessageComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 11/11/2023.
//

import SwiftUI
import RDDesignSystem

struct RDMessageComponent: View {
    var body: some View {
        VStack(spacing: 20) {
            RDMessageView(
                message: RDMessage(
                    message: "Hi want to book some desk, is it possible?",
                    date: "3:00 PM",
                    image: ""
                )
            )

            RDMessageView(
                type: .receiver,
                message: RDMessage(
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

struct RDMessageComponent_Previews: PreviewProvider {
    static var previews: some View {
        RDMessageComponent()
    }
}
