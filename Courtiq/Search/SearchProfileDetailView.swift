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
    
    init(user: User,
         relationsService: RelationshipService)
    {
        self.user = user
        self.relationsService = relationsService
        self._friendCount = State(initialValue: 0)
        self._clubCount = State(initialValue: 0)
        fetchCounts()
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
            RDCardView(type: .primary) {
                HStack(alignment: .top) {
                    AvatarImage(size: .medium,
                                url: user.imageUrls?[.medium]?.url)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(user.displayName ?? "")
                            .rdBodyBold()
                            .foregroundStyle(Color.TokenColor.Semantic.Text.default)
                        Text("@\(user.username) | \(CountryManager.shared.getCountryFlag(fromCode: user.nationality!) ?? "🏳️") \(user.gender ?? "")")
                            .rdSmallBody()
                            .foregroundStyle(Color.TokenColor.Semantic.Text.primary)
                        
                        RDActionRow(actionItems: [(value: "Friends", title: "\(friendCount)", action: {}),
                                                  (value: "Clubs", title: "\(clubCount)", action: {}),
                                                  (value: "Matches", title: "12", action: {}),
                                                  (value: "Losses", title: "7", action: {})])
                    }
                    Spacer()
                }
            }
        } footer: {
            RDButtonView(.extraLarge, .primary, "Send Friend Request") {
                Task {
                    print("Send Friend Request tapped")
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Private
    
    @State private var friendCount: Int = 0
    @State private var clubCount: Int = 0
    @EnvironmentObject private var router: AppRouter
    @ObservedObject private var relationsService: RelationshipService
    private var user: User
    
    private func fetchCounts() {
        Task {
            do {
                friendCount = try await relationsService.getFriendCount(for: user.uid)
                clubCount = try await relationsService.getClubCount(for: user.uid)
            } catch {
                print("Failed to fetch counts: \(error)")
            }
        }
    }
}

//#Preview {
//    SearchProfileDetailView(user: User(uid: ""))
//        .environmentObject(AppRouter())
//        .environmentObject(RelationshipService())
//        .previewLayout(.sizeThatFits)
//}
