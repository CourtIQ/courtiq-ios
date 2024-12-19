//
//  MatchesFilterView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-16.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI

// MARK: - AddStringView

struct MatchesFilterView: View {

    // MARK: - Internal

    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "MatchesFilterView", leading: {}, trailing: {
                RDActionIcon(type: .ghost, size: .medium, image: Image.Token.Icons.close) {
                    print("MatchesFilterView")
                }
            })
        } content: {
            Text("Matches Filter View")
        } footer: {
            RDButtonView(.large, .primary, "Apply") {
                print("Matches Filter View")
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Private Properties
}
