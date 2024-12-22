//
//  ChatView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-15.
//

import SwiftUI
import RDDesignSystem
import UserService

struct ChatView: View {
    @Binding var showSideMenu: Bool
    var body: some View {
        BaseTabPageView {
            RDNavigationBar(.primary, title: "Chat", leading: {
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
    }
}
