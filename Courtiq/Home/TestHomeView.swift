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


