//
//  SideMenuVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-08.
//

import AuthenticationService
import UserService
import SwiftUI

final class SideMenuVM: ViewModel {
    
    // MARK: - Internal Properties
        
    var menuItems: [MenuItem] = [
        MenuItem(title: "Home", icon: Image.Token.Icons.menu),
        MenuItem(title: "Search", icon: Image.Token.Icons.search),
        MenuItem(title: "Tennis", icon: Image.Token.Icons.tennisBall),
        MenuItem(title: "Profile", icon: Image.Token.Icons.person)
    ]
    
    @MainActor
    var mediumImageUrl: URL? {
        guard let urlString = userService.currentUser?.imageUrls?[.medium]?.url else { return nil }
        return URL(string: urlString)
    }
    
    // MARK: - Private Properties
    
    private let authService: any AuthServiceProtocol
    private let userService: any UserServiceProtocol
    private let router: AppRouter

    // MARK: - Lifecycle
    init(authService: any AuthServiceProtocol,
         userService: any UserServiceProtocol)
    {
        self.authService = authService
        self.userService = userService
    }
    
    // MARK: - Internal Methods
    
    func handle(action: SideMenuVM.Actions) {
        switch action {
        case .logout:
            signOut()
        case .menuItemTapped:
            menuItemTapped()
        case .profilePictureTapped:
            profilePictureTapped()
        }
    }
    func onAppear() {
        // Add your code here.
    }
    
    func onDisappear() {
        // Add your code here.
    }
    
    // MARK: - Private Methods
    
    private func signOut() {
        Task {
            try await authService.signOut()
        }
    }
    
    private func menuItemTapped() {
        // Add your code here.
    }
    
    private func profilePictureTapped() {
        // Add your code here.
    }
}

extension SideMenuVM {
    
    // MARK: Actions
    enum Actions {
        case logout
        case menuItemTapped
        case profilePictureTapped
    }
}

