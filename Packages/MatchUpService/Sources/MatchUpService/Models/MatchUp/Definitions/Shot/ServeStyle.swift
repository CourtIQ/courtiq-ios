//
//  ServeType.swift
//
//
//  Created by Pranav Suri on 2024-07-11.
//

import Foundation

// MARK: - ServeType Enum

/// Represents the style of a tennis serve.
///
/// The style can be flat, kick, slice, or other.
public enum ServeStyle: String, Codable, CustomStringConvertible, CaseIterable {
    
    /// A flat serve.
    case flat = "FL"
    
    /// A kick serve.
    case kick = "KI"
    
    /// A slice serve.
    case slice = "SL"
    
    /// Any other type of serve.
    case other = "OT"
    
    // MARK: - Properties
    
    /// Provides a human-readable description of the serve type.
    public var description: String {
        switch self {
        case .flat:
            return "Flat"
        case .kick:
            return "Kick"
        case .slice:
            return "Slice"
        case .other:
            return "Other"
        }
    }
    
    /// Provides the code representation of the serve type.
    public var code: String {
        return self.rawValue
    }
}
