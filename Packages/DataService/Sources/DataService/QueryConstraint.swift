// QueryConstraint.swift
// DataService
//
// Created by Pranav Suri on 2024-08-05.

import Foundation

// MARK: - QueryConstraint Enum

/// Represents various constraints that can be applied to queries when fetching documents from a collection.
///
/// Each case corresponds to a different type of constraint that can be used in queries to filter documents.
public enum QueryConstraint {
    
    // MARK: - Cases
    
    /// Constraints documents where the specified field equals the given value.
    /// - Parameters:
    ///   - field: The name of the field to be checked.
    ///   - value: The value to compare the field against.
    case equalTo(field: String, value: Any)
    
    /// Constraints documents where the specified field is less than the given value.
    /// - Parameters:
    ///   - field: The name of the field to be checked.
    ///   - value: The value to compare the field against.
    case lessThan(field: String, value: Any)
    
    /// Constraints documents where the specified field is greater than the given value.
    /// - Parameters:
    ///   - field: The name of the field to be checked.
    ///   - value: The value to compare the field against.
    case greaterThan(field: String, value: Any)
    
    /// Constraints documents where the specified field is less than or equal to the given value.
    /// - Parameters:
    ///   - field: The name of the field to be checked.
    ///   - value: The value to compare the field against.
    case lessThanOrEqualTo(field: String, value: Any)
    
    /// Constraints documents where the specified field is greater than or equal to the given value.
    /// - Parameters:
    ///   - field: The name of the field to be checked.
    ///   - value: The value to compare the field against.
    case greaterThanOrEqualTo(field: String, value: Any)
    
    /// Constraints documents where the specified field contains the given value in an array.
    /// - Parameters:
    ///   - field: The name of the field to be checked.
    ///   - value: The value to check for presence in an array.
    case arrayContains(field: String, value: Any)
    
    /// Constraints documents where the specified field matches any value in the given array.
    /// - Parameters:
    ///   - field: The name of the field to be checked.
    ///   - values: The array of values to check against.
    case `in`(field: String, values: [Any])
    
    /// Constraints documents where the specified field does not match any value in the given array.
    /// - Parameters:
    ///   - field: The name of the field to be checked.
    ///   - values: The array of values to exclude.
    case notIn(field: String, values: [Any])
}
