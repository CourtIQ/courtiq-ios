//
//  HomeView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import SwiftUI
import RDDesignSystem
import AuthenticationService

struct TestHomeView: View {
    @Binding var showSideMenu: Bool
    @EnvironmentObject var authService: AuthService

    var body: some View {
        Group {
            VStack{
                RDTopNavigationView(
                    params: RDTopNavigationParams(
                        type: .primary, title: "Test",
                        leadingItem: AnyView(
                            RDIconButton(
                                .tertiary,
                                .small,
                                Image(systemName: "line.horizontal.3"),
                                action: {
                                    showSideMenu.toggle()
                                }
                            )
                        )))
                RDButtonView(.extraLarge, .tertiary, "Log out") {
                    Task {
                        try await authService.signOut()
                    }
                }
                Spacer()
                Text("hello")
            }
            .frame(width: getRect().width)
            
        }
    }
}

// MARK: - Preview

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}


