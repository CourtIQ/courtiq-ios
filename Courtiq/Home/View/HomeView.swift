//
//  HomeView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import SwiftUI
import RDDesignSystem
import AuthenticationService

struct HomeView: View {
    @StateObject private var vm: HomeVM
    
    init(vm: HomeVM) {
        self._vm = StateObject(wrappedValue: vm)
    }

    var body: some View {
        HomeTabPage {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Welcome to CourtIQ",
                    leadingItem: AnyView(
                        RDIconButton(
                            .tertiary, .small, Image(systemName: "line.horizontal.3"),
                            action:
                                {
                                    Task {
                                        do {
                                            try await vm.authService.signOut()
                                        } catch {
                                            print("Error signing out: \(error)")
                                        }
                                    }
                                }
                        )
                    ),
                    trailingItem: AnyView(
                        RDAvatarView(
                            rdAvatarSizing: .small,
                            rdAvatarBadgeType: .none)
                    )
                )
            )
        } content: {
            Text("Home")
        }

    }
}

// MARK: - Preview

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}


