//
//  ChatView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-15.
//

import SwiftUI
import RDDesignSystem
import RelationshipService
import UserService

struct ChatView: View {
    @Binding var showSideMenu: Bool
    var body: some View {
        BaseTabPageView {
            RDNavigationBar(.primary, title: "Chat", leading: {
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
    }
}
