//
//  MatchUpPoint.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - MatchUpPoint Struct

/// Represents a point in a tennis match.
///
/// This struct tracks details about a specific point within a match, including which player served,
/// which player won the point, the reason for winning the point, and the timing of the point.
public struct MatchUpPoint: Codable {
    
    // MARK: - Properties
    
    /// The number of the point in the sequence of the match.
    ///
    /// This helps in tracking the order of points within a match.
    public var pointNumber: Int
    
    /// The player who served the point.
    ///
    /// This indicates which player served the ball at the start of the point.
    public var server: Player?
    
    /// The player who won the point.
    ///
    /// This indicates which player won the point.
    public var winner: Player?
    
    /// The reason the point was won.
    ///
    /// This provides context on how the point was won, such as through an ace, a winner, or a forced error.
    public var winReason: PointWinReason?
    
    /// The start time of the point.
    ///
    /// This records when the point began.
    public var pointStartTime: Date?
    
    /// The end time of the point.
    ///
    /// This records when the point ended.
    public var pointEndTime: Date?
    
    /// The last time the point details were updated.
    ///
    /// This helps in tracking when the point information was last modified.
    public var lastUpdated: Date?
    
    // MARK: - Computed Properties
    
    /// Calculates the duration of the point.
    ///
    /// This property computes the duration of the point from start to end time.
    public var duration: TimeInterval? {
        guard let start = pointStartTime, let end = pointEndTime else {
            return nil
        }
        return end.timeIntervalSince(start)
    }
    
    // MARK: - Initializer
    
    /// Initializes a new `MatchUpPoint` with the specified parameters.
    ///
    /// - Parameters:
    ///   - pointNumber: The number of the point in the sequence of the match.
    ///   - server: The player who served the point.
    ///   - winner: The player who won the point.
    ///   - winReason: The reason the point was won.
    ///   - pointStartTime: The start time of the point.
    ///   - pointEndTime: The end time of the point.
    ///   - lastUpdated: The last time the point details were updated.
    public init(pointNumber: Int, server: Player? = nil, winner: Player? = nil, winReason: PointWinReason? = nil, pointStartTime: Date? = nil, pointEndTime: Date? = nil, lastUpdated: Date? = nil) {
        self.pointNumber = pointNumber
        self.server = server
        self.winner = winner
        self.winReason = winReason
        self.pointStartTime = pointStartTime
        self.pointEndTime = pointEndTime
        self.lastUpdated = lastUpdated
    }
}
