//
//  User.swift
//
//
//  Created by Pranav Suri on 2024-07-04.
//

import Foundation
import FirebaseFirestore

public struct User: Identifiable, Codable {
    public var id: String?
    public var uid: String
    public var displayName: String?
    public var firstName: String?
    public var lastName: String?
    public var email: String?
    public var gender: String?
    public var nationality: String?
    public var dob: Date?
    public var phoneNumber: String?
    public var imageUrl: String?
    public var createdAt: Date
    public var lastUpdated: Date?

    enum CodingKeys: String, CodingKey {
        case id = "objectID"
        case uid
        case displayName
        case firstName
        case lastName
        case email
        case gender
        case nationality
        case dob
        case phoneNumber
        case imageUrl
        case createdAt
        case lastUpdated
    }

    public init(id: String? = nil,
                uid: String,
                displayName: String? = nil,
                firstName: String? = nil,
                lastName: String? = nil,
                email: String? = nil,
                gender: String? = nil,
                nationality: String? = nil,
                dob: Date? = nil,
                phoneNumber: String? = nil,
                imageUrl: String? = nil,
                createdAt: Date = Date(),
                lastUpdated: Date? = nil) {
        self.id = id
        self.uid = uid
        self.displayName = displayName
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.gender = gender
        self.nationality = nationality
        self.dob = dob
        self.phoneNumber = phoneNumber
        self.imageUrl = imageUrl
        self.createdAt = createdAt
        self.lastUpdated = lastUpdated
    }
}
