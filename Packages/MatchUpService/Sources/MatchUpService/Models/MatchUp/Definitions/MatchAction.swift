//
//  MatchAction.swift
//  
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - MatchAction Enum

/// Represents various actions that can occur during a tennis match.
public enum MatchAction: Codable {
    
    // MARK: - Scoring and Serve-Related Actions

    /// Represents a point won by a player.
    /// - Parameters:
    ///   - player: The player who won the point.
    ///   - shot: The type of shot used to win the point (optional).
    ///   - style: The style of the shot used to win the point (optional).
    ///   - winReason: The reason for winning the point (optional).
    case winPoint(player: Player, shot: ShotType? = nil, style: ShotStyle? = nil, winReason: PointWinReason? = nil)

    /// Represents a point lost by a player.
    /// - Parameters:
    ///   - player: The player who lost the point.
    ///   - shot: The type of shot that caused the loss (optional).
    ///   - style: The style of the shot that caused the loss (optional).
    ///   - winReason: The reason for losing the point (optional).g
    case losePoint(player: Player, shot: ShotType? = nil, style: ShotStyle? = nil, winReason: PointWinReason? = nil)

    /// Represents an ace serve by a player.
    /// - Parameters:
    ///   - player: The player who served the ace.
    ///   - serveType: The type of serve used for the ace (optional).
    case ace(player: Player, serveType: ServeStyle? = nil)

    /// Represents a double fault by a player.
    /// - Parameters:
    ///   - player: The player who committed the double fault.
    case doubleFault(player: Player)

    /// Represents a successful first serve by a player.
    /// - Parameters:
    ///   - player: The player who made the first serve.
    ///   - serveType: The type of serve used (optional).
    case firstServeIn(player: Player, serveType: ServeStyle? = nil)

    /// Represents a successful second serve by a player.
    /// - Parameters:
    ///   - player: The player who made the second serve.
    ///   - serveType: The type of serve used (optional).
    case secondServeIn(player: Player, serveType: ServeStyle? = nil)

    /// Represents a fault on the first serve by a player.
    /// - Parameters:
    ///   - player: The player who committed the first serve fault.
    case firstServeFault(player: Player)

    /// Represents a fault on the second serve by a player.
    /// - Parameters:
    ///   - player: The player who committed the second serve fault.
    case secondServeFault(player: Player)

    // MARK: - Specific Play Results

    /// Represents a winner shot by a player.
    /// - Parameters:
    ///   - player: The player who made the winner shot.
    ///   - shot: The type of shot used (optional).
    ///   - style: The style of the shot used (optional).
    case winner(player: Player, shot: ShotType? = nil, style: ShotStyle? = nil)

    /// Represents a forced error by a player.
    /// - Parameters:
    ///   - player: The player who caused the forced error.
    ///   - shot: The type of shot used (optional).
    ///   - style: The style of the shot used (optional).
    case forcedError(player: Player, shot: ShotType? = nil, style: ShotStyle? = nil)

    /// Represents an unforced error by a player.
    /// - Parameters:
    ///   - player: The player who committed the unforced error.
    ///   - shot: The type of shot used (optional).
    ///   - style: The style of the shot used (optional).
    case unforcedError(player: Player, shot: ShotType? = nil, style: ShotStyle? = nil)

    // MARK: - Serve Return Specifics

    /// Represents a serve return winner by a player.
    /// - Parameters:
    ///   - player: The player who made the serve return winner.
    ///   - shot: The type of shot used (optional).
    ///   - style: The style of the shot used (optional).
    case serveReturnWinner(player: Player, shot: ShotType? = nil, style: ShotStyle? = nil)

    /// Represents a serve return error by a player.
    /// - Parameters:
    ///   - player: The player who made the serve return error.
    ///   - shot: The type of shot used (optional).
    ///   - style: The style of the shot used (optional).
    case serveReturnError(player: Player, shot: ShotType? = nil, style: ShotStyle? = nil)

    // MARK: - Game, Set, Match Control

    /// Represents the start of a new game.
    case startNewGame

    /// Represents the end of a game.
    /// - Parameters:
    ///   - winner: The player who won the game.
    case endGame(winner: Player)

    /// Represents the start of a new set.
    case startNewSet

    /// Represents the end of a set.
    /// - Parameters:
    ///   - winner: The player who won the set.
    case endSet(winner: Player)

    /// Represents the start of a tiebreak.
    case startTiebreak

    /// Represents the end of a tiebreak.
    /// - Parameters:
    ///   - winner: The player who won the tiebreak.
    case endTiebreak(winner: Player)

    /// Represents the start of a match between two players with the match format.
    /// - Parameters:
    ///   - player1: The first player in the match.
    ///   - player2: The second player in the match.
    ///   - matchFormat: The format of the match.
    case startMatch(player1: Player, player2: Player, matchFormat: MatchUpFormat)

    /// Represents the end of a match with the winner, loser, and the reason for the win.
    /// - Parameters:
    ///   - winner: The player who won the match.
    ///   - loser: The player who lost the match.
    ///   - winReason: The reason for winning the match (optional).
    case endMatch(winner: Player, loser: Player, winReason: MatchUpStatus? = nil)

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
