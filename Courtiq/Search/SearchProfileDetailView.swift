//
//  SearchProfileDetailView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-12.
//

import AuthenticationService
import RDDesignSystem
import RelationshipService
import SwiftUI
import UserService

// MARK: - SearchProfileDetailView

struct SearchProfileDetailView: View {
    
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
    }
    
    // MARK: - Internal
    
    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "", leading: {
                Image.Token.Icons.back
                    .rdActionIcon {
                        router.handle(action: .pop)
                    }
            }, trailing: {
                Image.Token.Icons.filter
                    .rdActionIcon {
                        print("Filter tapped")
                    }
            })
        } content: {
            Text("")
        } footer: {
            RDButtonView(.extraLarge, .primary, "Send Friend Request") {
                Task {
                    try await relationshipService.sendFriendRequest(from: currentUserID ?? "",
                                                                    to: user.uid)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Private
    @EnvironmentObject private var router: AppRouter
    @EnvironmentObject private var relationshipService: RelationshipService

    @AppStorage("currentUserUID") private var currentUserID: String?

    private var user: User
}

#Preview {
    SearchProfileDetailView(user: User(uid: ""))
        .environmentObject(AppRouter())
        .environmentObject(RelationshipService())
        .previewLayout(.sizeThatFits)
}
