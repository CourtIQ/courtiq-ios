//
//  SearchProfileDetailView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-12.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI
import UserService

// MARK: - SearchProfileDetailView

struct SearchProfileDetailView: View {
    
    // MARK: - Lifecycle
    
//    init(user: User) {
//        self.user = user
//    }
//    
    // MARK: - Internal
    
    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "", leading: {
                RDActionIcon(type: .ghost, size: .medium, image: Image.Token.Icons.back) {
                    router.handle(action: .pop)
                }
            }, trailing: {
                RDActionIcon(type: .ghost, size: .medium, image: Image.Token.Icons.filter) {
                    print("Filter tapped")
                }
            })
        } content: {
            Text("")
        } footer: {
            RDButtonView(.extraLarge, .primary, "Send Friend Request") {
                print("Send Friend Request tapped")
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Private
    @EnvironmentObject private var router: AppRouter

    @AppStorage("currentUserUID") private var currentUserID: String?

}
