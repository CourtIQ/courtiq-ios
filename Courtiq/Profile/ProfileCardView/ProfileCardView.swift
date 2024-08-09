//
//  ProfileCardView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-09.
//

import RDDesignSystem
import SwiftUI
import UserService
import AuthenticationService

struct ProfileCardView: View {
    
    // MARK: Lifecycle
    
    init(vm: ProfileVM) {
        self.vm = vm
    }
    
    // MARK: Internal
    
    var body: some View {
        RDCardView(type: .primary) {
            HStack(alignment: .top, spacing: 12) {
                AvatarImage(size: .large,
                            url: vm.mediumImageUrl?.absoluteString)
                
                VStack(spacing: 2) {
                    profileTextContent()
                    
                    ActionItemRowView(items: [
                        (title: "Friends", count: 311, action: {
                            vm.handle(action: .actionRowItemTapped(0))
                        }),
                        (title: "Matches", count: 12, action: {
                            vm.handle(action: .actionRowItemTapped(1))
                        }),
                        (title: "Wins", count: 15, action: {
                            vm.handle(action: .actionRowItemTapped(2))
                        }),
                        (title: "Losses", count: 7, action: {
                            vm.handle(action: .actionRowItemTapped(3))
                        })
                    ])
                    .frame(maxWidth: .infinity)
                }
            }
        }
        
    }
    
    // MARK: - Private
    
    @ViewBuilder
    private func profileTextContent() -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .rdBodyBold()
                .foregroundStyle(Color.TokenColor.Semantic.Text.default)
            
            Text(subtitle)
                .rdBody()
                .foregroundStyle(Color.TokenColor.Semantic.Text.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.red)
    }
    
    private var title: String {
        if let firstName = vm.currentUser?.firstName,
           let lastName = vm.currentUser?.lastName {
            return "\(firstName) \(lastName)"
        }
        return ""
    }
    private var subtitle: String { return "🇮🇳 India  |  Male  |  22" }
    
    @ObservedObject private var vm: ProfileVM
}

#Preview {
    ProfileCardView(vm: ProfileVM(userService: UserService(), authService: AuthService(provider: FirebaseAuthProvider()), router: AppRouter()))
}
