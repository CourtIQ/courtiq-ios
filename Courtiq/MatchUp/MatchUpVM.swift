//
//  MatchUpVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-04.
//

import Foundation
import MatchUpService

final class MatchUpVM: ViewModel {
    
    // MARK: - Internal Properties
    
    @Published var matchUpFormat = MatchUpFormat(numberOfSets: .one,
                                                 setFormat: SetFormat(
                                                    numberOfGames: .six,
                                                    deuceType: .normalDeuce,
                                                    mustWinByTwo: true))
    @Published var asa = MatchUpFormat()

    // MARK: - Private Properties
    
    
    // MARK: - Initializer
    init() {
    }
    
    // MARK: - Internal Methods
    
    func handle(action: MatchUpVM.Actions) {
        switch action {
        case .show:
            return
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
        case show
    }
}
