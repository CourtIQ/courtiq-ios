//
//  HomeBaseVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-24.
//

import AuthenticationService
import EquipmentService
import Foundation
import EquipmentService
import RDDesignSystem
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
    
    init(router: AppRouter)
    {
        self.router = router
    }
    
    // MARK: - Internal

    @Published var selectedTab: Int = 0
    @Published var sideMenuShowing = false
    
    let tabBarItems = [
        RDTabBarItem(title: "Home", icon: Image.Token.Icons.home),
        RDTabBarItem(title: "Search", icon: Image.Token.Icons.search),
        RDTabBarItem(title: "Tennis", icon: Image.Token.Icons.tennisBall),
        RDTabBarItem(title: "Chat", icon: Image.Token.Icons.chat),
        RDTabBarItem(title: "Profile", icon: Image.Token.Icons.person),
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
    
    @Dependency(\.authService) private var authService
    @Dependency(\.userService) private var userService
    @Dependency(\.equipmentService) private var equipmentService
    public var router: AppRouter

    func onAppear() {
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
