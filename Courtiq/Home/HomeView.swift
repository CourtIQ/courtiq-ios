//
//  HomeView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-08.
//

import SwiftUI
import RDDesignSystem

struct HomeView: View {
    @Binding var showSideMenu: Bool
    
    var body: some View {
        BaseTabPageView {
            RDNavigationBar(.primary, title: "CourtIQ", leading: {
                Image.Token.Icons.menu
                    .rdActionIcon {
                        showSideMenu.toggle()
                    }
            }, trailing: {
                Image.Token.Icons.person
                    .rdActionIcon {
                        print("profile pressed")
                    }
            })
        } content: {
            Text("Hello, World!")
        }
    }
}
