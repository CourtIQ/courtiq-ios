//
//  ProfileVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-04.
//

import AuthenticationService
import Foundation
import UserService
import RelationshipService
import SwiftUI

@MainActor
final class ProfileVM: ViewModel {
    
    // MARK: - Internal
    var currentUser: User? {
        return userService.currentUser
    }
    
    var smallImageUrl: URL? {
        guard let urlString = currentUser?.imageUrls?[.small]?.url else { return nil }
        return URL(string: urlString)
    }
    
    var mediumImageUrl: URL? {
        guard let urlString = currentUser?.imageUrls?[.medium]?.url else { return nil }
        return URL(string: urlString)
    }
    
    var largeImageUrl: URL? {
        guard let urlString = currentUser?.imageUrls?[.large]?.url else { return nil }
        return URL(string: urlString)
    }
    
    var statsActionItems: [String : Int] {
        ["Friends": 123,
         "Matches": 22,
         "Wins": 15,
         "Losses": 7]
    }
    
    // MARK: - Private Properties
    
    private var userService: any UserServiceProtocol
    private var authService: any AuthServiceProtocol
    private var router: AppRouter
    
    
    
    // MARK: - Initializer
    init(userService: any UserServiceProtocol,
         authService: any AuthServiceProtocol,
         router: AppRouter)
    {
        self.userService = userService
        self.authService = authService
        self.router = router
    }
    
    // MARK: - Internal Methods
    
    func handle(action: ProfileVM.Actions) {
        switch action {
        case .settingsIconTapped:
            goToSettings()
        case .actionRowItemTapped(let index):
            handleActionRowItemTapped(index: index)
        case .profilePictureTapped:
            goToProfilePictureView()
        case .statsCardTapped:
            handleStatsCardTappedTapped()
        case .matchUpTapped:
            handeMatchUpTapped()
        }
    }
    
    func onAppear() {
        // Add your code here.
    }
    
    func onDisappear() {
        // Add your code here.
    }
    
    // MARK: - Private Methods
    
    private func goToSettings() {
        let view = SettingsView()
        router.handle(action: .showScreen(AnyView(view)))
    }
    
    private func handleActionRowItemTapped(index: Int) {
        switch index {
        case 0:
            let view = Text("Friends Lsit")
            router.handle(action: .push(AnyView(view)))
        case 1:
            let view = Text("Matches Lsit")
            router.handle(action: .push(AnyView(view)))
        case 2:
            let view = Text("Wins Lsit")
            router.handle(action: .push(AnyView(view)))
        case 3:
            let view = Text("Losses Lsit")
            router.handle(action: .push(AnyView(view)))
        default:
            return
        }
    }
    
    private func handleStatsCardTappedTapped() {
        print(#function)
    }
    
    private func goToProfilePictureView() {
        print(#function)
    }
    
    private func handeMatchUpTapped() {
        print(#function)
    }
}

extension ProfileVM {
    
    // MARK: Actions
    enum Actions {
        case settingsIconTapped
        case actionRowItemTapped(Int)
        case profilePictureTapped
        case statsCardTapped
        case matchUpTapped
    }
}

