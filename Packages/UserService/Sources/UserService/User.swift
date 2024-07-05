//
//  User.swift
//
//
//  Created by Pranav Suri on 2024-07-04.
//

import Foundation
import FirebaseFirestore

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var uid: String
    var displayName: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var gender: String?
    var nationality: String?
    var dob: Date?
    var phoneNumber: String?
    var photoURL: String?
    var createdAt: Date?
    var lastUpdated: Date?
    
    init(id: String? = nil,
         uid: String,
         displayName: String? = nil,
         firstName: String? = nil,
         lastName: String? = nil,
         email: String? = nil,
         gender: String? = nil,
         nationality: String? = nil,
         dob: Date? = nil,
         phoneNumber: String? = nil,
         photoURL: String? = nil,
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
        self.photoURL = photoURL
        self.createdAt = createdAt
        self.lastUpdated = lastUpdated
    }
}
