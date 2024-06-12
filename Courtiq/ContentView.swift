//
//  ContentView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-12.
//

import SwiftUI
import SwiftData
import DynamicLayers

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Set Score")
            Text("Game Score")
            HStack {
                RDButtonView(.large, .primary, "Player 1") {
                    print("Player 1 wins")
                }
                RDButtonView(.large, .primary, "Player 1") {
                    print("Player 2 wins")
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
