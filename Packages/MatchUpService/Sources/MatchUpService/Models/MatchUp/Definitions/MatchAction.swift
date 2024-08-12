//
//  MatchAction.swift
//  
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - MatchAction Enum

/// Represents various simple actions that can occur during a tennis match.
public enum MatchAction: Codable {
    
    // MARK: - Scoring and Serve-Related Actions

    /// Represents a point won by a player.
    case winPoint

    /// Represents a point lost by a player.
    case losePoint

    /// Represents an ace serve by a player.
    case ace

    /// Represents a double fault by a player.
    case doubleFault

    /// Represents a successful first serve by a player.
    case firstServeIn

    /// Represents a successful second serve by a player.
    case secondServeIn

    /// Represents a fault on the first serve by a player.
    case firstServeFault

    /// Represents a fault on the second serve by a player.
    case secondServeFault

    // MARK: - Specific Play Results

    /// Represents a winner shot by a player.
    case winner

    /// Represents a forced error by a player.
    case forcedError

    /// Represents an unforced error by a player.
    case unforcedError

    // MARK: - Serve Return Specifics

    /// Represents a serve return winner by a player.
    case serveReturnWinner

    /// Represents a serve return error by a player.
    case serveReturnError

    // MARK: - Game, Set, Match Control

    /// Represents the start of a new game.
    case startNewGame

    /// Represents the end of a game.
    case endGame

    /// Represents the start of a new set.
    case startNewSet

    /// Represents the end of a set.
    case endSet

    /// Represents the start of a tiebreak.
    case startTiebreak

    /// Represents the end of a tiebreak.
    case endTiebreak

    /// Represents the start of a match between two players.
    case startMatch

    /// Represents the end of a match.
    case endMatch

    /// Represents pausing the match.
    case pauseMatch

    /// Represents resuming the match.
    case resumeMatch

    /// Represents restarting the match.
    case restartMatch

    /// Represents restarting the current game.
    case restartGame

    /// Represents restarting the current set.
    case restartSet

    // MARK: - Historical Actions

    /// Represents undoing the last recorded action.
    case undoLastAction

    /// Represents redoing the last undone action.
    case redoAction
}
