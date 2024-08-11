//
//  HomeView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-08.
//

import SwiftUI
import RDDesignSystem
import UserService

struct HomeView: View {
    @Binding var showSideMenu: Bool
    @EnvironmentObject var userService: UserService
    
    var body: some View {
        BaseTabPageView {
            RDNavigationBar(.primary, title: "CourtIQ", leading: {
                Image.Token.Icons.menu
                    .rdActionIcon {
                        showSideMenu.toggle()
                    }
            }, trailing: {
                AvatarImage(size: .small,
                            url: userService.currentUser?.imageUrls?[.small]?.url ?? "")
            })
        } content: {
            List {
                ForEach(0..<8) { index in
                    HStack {
                        Text("Hello")
                        Spacer()
                    }
                }
            }
            .listStyle(.plain)
            .cornerRadius(12)
            .border(Color.TokenColor.Semantic.Border.default, width: 1 )
        }
    }
}
