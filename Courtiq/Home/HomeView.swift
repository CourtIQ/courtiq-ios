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
                Image.Token.Icons.menu
                    .rdActionIcon {
                        withAnimation {
                            showSideMenu.toggle()
                        }
                    }
            }, trailing: {
                Image.Token.Icons.bell
                    .rdActionIcon {
                        print("notificationtapped")
                    }
            })
        } content: {
            RDScoreCardView()
        }
        .onAppear {
            Task {
                try await relationshipService.fetchFriends(userId: userService.currentUser?.id ?? "")
            }
        }
    }
}
