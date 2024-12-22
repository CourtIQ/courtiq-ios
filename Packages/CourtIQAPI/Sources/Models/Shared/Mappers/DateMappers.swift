//
//  DateMappers.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import GraphQLModels

public extension API.DateTime {
    /// Converts a GraphQL `DateTime` string to a `Date` object.
    /// If the conversion fails, it returns the current date as a fallback.
    var dateValue: Date {
        let isoString = self
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: isoString) ?? Date()
    }
}

public extension GraphQLNullable where Wrapped == API.DateTime {
    /// Creates a `GraphQLNullable<DateTime>` from an optional `Date`.
    /// If `date` is `nil`, it returns `.null`; otherwise, it returns the ISO8601 string representation.
    static func from(_ date: Date?) -> GraphQLNullable<API.DateTime> {
        guard let date = date else { return .null }
        return .some(date.toISO8601String())
    }
}

public extension Date {
    /// Converts a `Date` to an ISO8601-formatted string representation.
    func toISO8601String() -> String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: self)
    }
}
