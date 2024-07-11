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

struct ProfileView: View {
    @Binding var showSideMenu: Bool
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var userService: UserService
    var body: some View {
        BaseTabPageView {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Profile",
                    leadingItem: AnyView(
                        RDIconButton(
                            .tertiary, .small, Image(systemName: "line.horizontal.3"),
                            action: {
                                showSideMenu.toggle()
                            }
                        )
                    ),
                    trailingItem: AnyView(
                        RDIconButton(.tertiary, .small, Image("settings"), action: {
                            print("Settings Button pressed")

                        })
                    )
                )
            )
        } content: {
            RDButtonView(.extraLarge, .primary, "Logout") {
                Task {
                    try await authService.signOut()
                }
            }
            Text("ProfileView")
            Text("\(authService.currentUser?.uid)")
            Text("\(authService.currentUser?.uid)")
            Text("\(String(describing: userService.currentUser?.firstName))")
            Text("\(String(describing: userService.currentUser?.lastName))")
        }
    }
}
