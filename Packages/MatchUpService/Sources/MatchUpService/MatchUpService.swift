//
//  MatchAction.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - MatchUpService

@available(iOS 13.0, *)
class MatchUpService: ObservableObject {

    // MARK: - Lifecycle
    
    init(matchUpFormat: MatchUpFormat) {
        self.matchUpFormat = matchUpFormat
    }
    
    // MARK: - Internal
    
    @Published var currentScore: String = "0-0"
    @Published var currentServer: String = "0-0"

    // MARK: - Private
    
    private let matchUpFormat: MatchUpFormat

    // MARK: - Internal Methods
    
    func handle(action: MatchAction) {
        switch action {
        case .startMatch:
            startMatch()
        case .winPoint:
            winPoint()
        case .losePoint:
            losePoint()
        case .endMatch:
            endMatch()
        default:
            print("not yet implemented")
        }
    }
    
    // MARK: - Private Methods
    
    private func startMatch() {
        // Implement match start logic
    }
    
    private func endMatch() {
        // Implement match end logic
    }
    
    private func winPoint() {
        // Implement winning point logic
    }
    
    private func losePoint() {
        // Implement losing point logic
    }
}

// MARK: - MatchStatistics

struct MatchStatistics {
    var player1PointsWon: Int = 0
    var player2PointsWon: Int = 0
    
    // Add more detailed statistics as needed
}
