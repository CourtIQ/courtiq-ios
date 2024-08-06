//
//  ProfileView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-08.
//

import SwiftUI
import RDDesignSystem
import AuthenticationService
import UserService

// MARK: - ProfileView

struct ProfileView: View {
    // MARK: - Properties
    
    @Binding var showSideMenu: Bool
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var userService: UserService
    
    private var navigationParams: RDTopNavigationParams {
        RDTopNavigationParams(
            type: .primary,
            title: "Profile",
            leadingItem: (
                leadingItemType: .tertiary,
                leadingItemIcon: Image(systemName: "line.horizontal.3"),
                leadingItemAction: {
                    showSideMenu.toggle()
                }
            ),
            trailingItem: (
                trailingItemType: .tertiary,
                trailingItemIcon: Image("settings"),
                trailingItemAction: {
                    print("Settings Button pressed")
                }
            )
        )
    }

    // MARK: - Body
    
    var body: some View {
        
        BaseTabPageView {
            RDTopNavigationBar(params: navigationParams)
        } content: {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "person")
                VStack(alignment: .leading) {
                    if let currentUser = userService.currentUser {
                        Text("\(currentUser.firstName ?? "-") \(currentUser.lastName ?? "-")")
                            .rdHeadline()
                    }
                    
                    RDButtonView(.small, .primary, "Edit Profile") {
                        Task {
                            try await authService.signOut()
                        }
                    }
                }
            }
        }
    }
}
