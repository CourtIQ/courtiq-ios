//
//  DateMappers.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation
import Models

extension API.DateTime {
    var dateValue: Date {
        let isoString = self
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: isoString) ?? Date()
    }
}

extension GraphQLNullable where Wrapped == API.DateTime {
    static func from(_ date: Date?) -> GraphQLNullable<API.DateTime> {
        guard let date = date else { return .null }
        return .some(date.toISO8601String())
    }
}

extension Date {
    func toISO8601String() -> String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: self)
    }
}

