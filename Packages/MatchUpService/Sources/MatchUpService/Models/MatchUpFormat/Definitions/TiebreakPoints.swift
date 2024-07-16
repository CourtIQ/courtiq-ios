//
//  TiebreakPoints.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - TiebreakPoints Enum

/// Represents the number of points in a tiebreak.
///
/// The number of points in a tiebreak determines how many points a player needs to win
/// in order to win the tiebreak and, consequently, the set. This enum allows specifying
/// a range from one to ten points.
public enum TiebreakPoints: Int, CustomStringConvertible, Codable, CaseIterable {
    
    /// One point in a tiebreak.
    ///
    /// The player who wins one point wins the tiebreak.
    case one = 1
    
    /// Two points in a tiebreak.
    ///
    /// The player who wins two points wins the tiebreak.
    case two = 2
    
    /// Three points in a tiebreak.
    ///
    /// The player who wins three points wins the tiebreak.
    case three = 3
    
    /// Four points in a tiebreak.
    ///
    /// The player who wins four points wins the tiebreak.
    case four = 4
    
    /// Five points in a tiebreak.
    ///
    /// The player who wins five points wins the tiebreak.
    case five = 5
    
    /// Six points in a tiebreak.
    ///
    /// The player who wins six points wins the tiebreak.
    case six = 6
    
    /// Seven points in a tiebreak.
    ///
    /// The player who wins seven points wins the tiebreak.
    case seven = 7
    
    /// Eight points in a tiebreak.
    ///
    /// The player who wins eight points wins the tiebreak.
    case eight = 8
    
    /// Nine points in a tiebreak.
    ///
    /// The player who wins nine points wins the tiebreak.
    case nine = 9
    
    /// Ten points in a tiebreak.
    ///
    /// The player who wins ten points wins the tiebreak.
    case ten = 10
    
    // MARK: - Description
    
    /// A textual description of the number of points in a tiebreak.
    ///
    /// This provides a human-readable description of the enum value.
    public var description: String {
        return "\(self.rawValue) Point(s)"
    }
}
