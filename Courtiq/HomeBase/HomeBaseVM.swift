//
//  HomeBaseVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import AuthenticationService
import Foundation
import RDDesignSystem
import RelationshipService
import SwiftUI
import UserService

// MARK: - HomeBaseViewModelProvider

protocol HomeBaseViewModelProvider: ViewModel {
    var selectedTab: Int { get set }
    var sideMenuShowing: Bool { get set }
    var tabBarItems: [RDTabBarItem] { get }
}

// MARK: - HomeBaseVM

final class HomeBaseVM: HomeBaseViewModelProvider {

    // MARK: - Lifecycle
    
    init(authService: any AuthServiceProtocol,
         router: AppRouter)
    {
        self.authService = authService
        self.router = router
    }
    
    // MARK: - Internal

    @Published var selectedTab: Int = 0
    @Published var sideMenuShowing = false

    let tabBarItems = [
        RDTabBarItem(title: "Home", icon: Image.Token.Icons.home),
        RDTabBarItem(title: "Search", icon: Image.Token.Icons.search),
        RDTabBarItem(title: "Tennis", icon: Image.Token.Icons.tennisBall),
        RDTabBarItem(title: "Profile", icon: Image.Token.Icons.person)
    ]

    func handle(action: HomeBaseVM.Actions) {
        switch action {
        case .showSideMenu:
            sideMenuShowing.toggle()
        case .chageTab(let int):
            print("Hello")
        }
    }

    // MARK: - Private
    
    private let authService: any AuthServiceProtocol
    private let router: AppRouter

    func onAppear() {
        print("Hello")
    }
    
    func onDisappear() {
        print("Hello")
    }
    

}

// MARK: - Actions

extension HomeBaseVM {
    enum Actions {
        case showSideMenu
        case chageTab(Int)
    }
}
