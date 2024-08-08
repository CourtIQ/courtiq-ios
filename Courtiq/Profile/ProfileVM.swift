//
//  ProfileVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-04.
//

import AuthenticationService
import Foundation
import UserService
import SwiftUI

final class ProfileVM: ViewModel {
    
    // MARK: - Internal Properties
    
    // MARK: - Private Properties
    
    var userService: any UserServiceProtocol
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
        case .actionRowItemTapped:
            handleActionRowItemTapped()
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
    
    private func handleActionRowItemTapped() {
        router.handle(action: .push(AnyView(Text("Hello World!"))))
        print(#function)
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
        case actionRowItemTapped
        case profilePictureTapped
        case statsCardTapped
        case matchUpTapped
    }
}

