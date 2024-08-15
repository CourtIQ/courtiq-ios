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
    public var username: String
    public var displayName: String?
    public var email: String?
    public var gender: String?
    public var nationality: String?
    public var dob: Date?
    public var imageUrls: [ImageSize: ImageURL]?
    public var createdAt: Date
    public var lastUpdated: Date?

    enum CodingKeys: String, CodingKey {
        case id = "objectID"
        case uid
        case username
        case displayName
        case email
        case gender
        case nationality
        case dob
        case imageUrls
        case createdAt
        case lastUpdated
    }
    
    public init(id: String? = nil,
                uid: String,
                username: String = "",
                displayName: String? = nil,
                email: String? = nil,
                gender: String? = nil,
                nationality: String? = nil,
                dob: Date? = nil,
                imageUrls: [ImageSize: ImageURL]? = nil,
                createdAt: Date = Date(),
                lastUpdated: Date? = nil) {
        self.id = id
        self.uid = uid
        self.username = username
        self.displayName = displayName
        self.email = email
        self.gender = gender
        self.nationality = nationality
        self.dob = dob
        self.imageUrls = imageUrls
        self.createdAt = createdAt
        self.lastUpdated = lastUpdated
    }
}

public struct ImageURL: Codable {
    public var url: String
    public var size: ImageSize
    
    public init(url: String, size: ImageSize) {
        self.url = url
        self.size = size
    }
}

public enum ImageSize: String, Codable {
    case small
    case medium
    case large
    
    public var dimensions: (width: Int, height: Int) {
        switch self {
        case .small:
            return (100, 100)
        case .medium:
            return (200, 200)
        case .large:
            return (400, 400)
        }
    }
}
