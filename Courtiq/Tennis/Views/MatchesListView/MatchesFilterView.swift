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
            RDNavigationBar(.primary, title: "Add new string entry", leading: {}, trailing: {
                Image.Token.Icons.close
                    .rdActionIcon {
                        print("Add new string entry")
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
