//
//  ShotStyle.swift
//  
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - ShotStyle Enum

/// Represents different styles of tennis shots.
///
/// The styles can be drop shot, ground slice, ground stroke, half volley, lob, other, passing shot, smash, or volley.
public enum ShotStyle: String, Codable {
    
    /// A drop shot.
    case dropShot = "DS"
    
    /// A ground slice.
    case groundSlice = "GS"
    
    /// A ground stroke.
    case groundStroke = "GR"
    
    /// A half volley.
    case halfVolley = "HV"
    
    /// A lob.
    case lob = "LO"
    
    /// Any other type of shot.
    case other = "OT"
    
    /// A passing shot.
    case passingShot = "PS"
    
    /// A smash.
    case smash = "SM"
    
    /// A volley.
    case volley = "VO"
    
    // MARK: - Description
    
    /// Provides a human-readable description of the shot style.
    ///
    /// - Returns: A string describing the shot style.
    public var description: String {
        switch self {
        case .dropShot:
            return "Drop Shot"
        case .groundSlice:
            return "Ground Slice"
        case .groundStroke:
            return "Ground Stroke"
        case .halfVolley:
            return "Half Volley"
        case .lob:
            return "Lob"
        case .other:
            return "Other"
        case .passingShot:
            return "Passing Shot"
        case .smash:
            return "Smash"
        case .volley:
            return "Volley"
        }
    }
    
    // MARK: - Code
    
    /// Provides the code representation of the shot style.
    ///
    /// - Returns: A string representing the shot style code.
    public var code: String {
        return self.rawValue
    }
}
