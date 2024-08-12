//
//  MatchUpVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-04.
//

import Foundation
import MatchUpService
import SwiftUI

@MainActor
final class MatchUpVM: ViewModel {
    
    // MARK: - Internal Properties
    
    @Published var matchUpFormat = MatchUpFormat(numberOfSets: .one,
                                                 setFormat: SetFormat(
                                                    numberOfGames: .six,
                                                    deuceType: .normalDeuce,
                                                    mustWinByTwo: true))
    
    // MARK: - Private Properties
    
    private var router: AppRouter
    
    // MARK: - Initializer
    
    init(router: AppRouter)
    {
        self.router = router
    }
    
    // MARK: - Internal Methods
    
    func handle(action: MatchUpVM.Actions) {
        switch action {
        case .dismissTapped:
            router.handle(action: .dismiss)
        case .backTapped:
            router.handle(action: .pop)
        case .startMatch:
            break
        case .goToMatchFormatForm:
            let view = MatchUpFormFormatView(vm: self)
            router.handle(action: .push(AnyView(view)))
        }
    }
    func onAppear() {
        // Add your code here.
    }
    
    func onDisappear() {
        // Add your code here.
    }
    
    // MARK: - Private Methods
}

extension MatchUpVM {
    
    // MARK: Actions
    enum Actions {
        case dismissTapped
        case backTapped
        case startMatch
        case goToMatchFormatForm
    }
}
