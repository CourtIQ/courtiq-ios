//
//  HomeView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-08.
//

import SwiftUI
import RDDesignSystem
import RelationshipService
import UserService

struct HomeView: View {
    @Binding var showSideMenu: Bool
    @EnvironmentObject var userService: UserService
    @EnvironmentObject var relationshipService: RelationshipService
    var body: some View {
        BaseTabPageView {
            RDNavigationBar(.primary, title: "CourtIQ", leading: {
                RDActionIcon(type: .ghost, size: .medium, image: Image.Token.Icons.menu) {
                    withAnimation {
                        showSideMenu.toggle()
                    }
                }
            }, trailing: {
                RDActionIcon(type: .ghost, size: .medium, image: Image.Token.Icons.bell) {
                    print("notificationtapped")
                }
            })
        } content: {
            RDScoreCardView()
        }
        .onAppear {
            Task {
                try await userService.fetchCurrentUser()
            }
        }
    }
}
