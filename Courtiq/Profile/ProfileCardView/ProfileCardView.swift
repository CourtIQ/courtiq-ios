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
            Group {
                HStack(alignment: .top, spacing: 12) {
                    
                    VStack(alignment: .leading, spacing: 2) {
                        profileTextContent()
                        ActionItemRowView(items: [
                            (title: "TennisIQ", count: 311, action: {
                                vm.handle(action: .actionRowItemTapped(0))
                            }),
                            (title: "Friends", count: 12, action: {
                                vm.handle(action: .actionRowItemTapped(1))
                            }),
                            (title: "Matches", count: 15, action: {
                                vm.handle(action: .actionRowItemTapped(2))
                            }),
                            (title: "Wins", count: 7, action: {
                                vm.handle(action: .actionRowItemTapped(3))
                            })
                        ])
                    }
                }
            }
        }
    }
    
    // MARK: - Private
    
    private var title: String  = ""
    
    private var subtitle: String { return "🇮🇳 India  |  Male  |  22" }
    
    @ObservedObject private var vm: ProfileVM
    
    @ViewBuilder
    private func profileTextContent() -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .rdBodyBold()
                .foregroundStyle(Color.TokenColor.Semantic.Text.default)
            
            Text(subtitle)
                .rdSmallBody()
                .foregroundStyle(Color.TokenColor.Semantic.Text.secondary)
        }
    }
}

//#Preview {
//    ProfileCardView(vm: ProfileVM(userService: UserService(), authService: AuthService(provider: FirebaseAuthProvider()), router: AppRouter()))
//}
