//
//  CompleteUserRegistrationFormModels.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-20.
//

import Foundation
import Models

struct CompleteUserRegistrationFormModel {
    var username: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var gender: Gender? = nil
    var dateOfBirth: Date? = nil
    var bio: String = ""
    var city: String = ""
}

extension CompleteUserRegistrationFormModel {
    /// Converts the form model into a domain `UpdateUserInput`.
    func toUpdateUserInput() -> UpdateUserInput {
        // Only create a location if we have city information
        let location: Location? = city.isEmpty ? nil : Location(
            city: city,
            state: nil,
            country: nil,
            latitude: nil,
            longitude: nil
        )
        
        return UpdateUserInput(
            username: username.isEmpty ? nil : username,
            firstName: firstName.isEmpty ? nil : firstName,
            lastName: lastName.isEmpty ? nil : lastName,
            gender: gender,
            dateOfBirth: dateOfBirth,
            bio: bio.isEmpty ? nil : bio,
            location: location
        )
    }
}
