//
//  ProfileVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-04.
//

import AuthenticationService
import Foundation
import UserService

final class ProfileVM: ViewModel {
    
    // MARK: - Internal Properties
    
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
        case .goToSettings:
            goToSettings()
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
        print(#function)
    }
}

extension ProfileVM {
    
    // MARK: Actions
    enum Actions {
        case goToSettings
    }
}

