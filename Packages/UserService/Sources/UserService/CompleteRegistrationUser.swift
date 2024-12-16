//
//  EditableUser.swift
//  UserService
//
//  Created by Pranav Suri on 2024-12-15.
//

import Foundation
import Models

public struct CompleteRegistrationUser: Equatable {
    public var firstName: String
    public var lastName: String
    public var displayName: String
    public var username: String
    public var bio: String
    public var dateOfBirth: Date?
    public var gender: API.Gender?
    public var location: Location
    
    public struct Location: Equatable {
        public var city: String
        public var state: String
        public var country: String
        public var latitude: Double?
        public var longitude: Double?
        
        public init(
            city: String = "",
            state: String = "",
            country: String = "",
            latitude: Double? = nil,
            longitude: Double? = nil
        ) {
            self.city = city
            self.state = state
            self.country = country
            self.latitude = latitude
            self.longitude = longitude
        }
    }
    
    // Default initializer
    public init(
        firstName: String = "",
        lastName: String = "",
        displayName: String = "",
        username: String = "",
        bio: String = "",
        dateOfBirth: Date? = nil,
        gender: API.Gender? = nil,
        location: Location = Location()
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.displayName = displayName
        self.username = username
        self.bio = bio
        self.dateOfBirth = dateOfBirth
        self.gender = gender
        self.location = location
    }
    
    // Init from User model
    public init(from user: User) {
        self.firstName = user.firstName
        self.lastName = user.lastName
        self.displayName = user.displayName
        self.username = user.username
        self.bio = user.bio ?? ""
        self.dateOfBirth = user.dateOfBirth
        self.location = Location(
            city: user.location?.city ?? "",
            state: user.location?.state ?? "",
            country: user.location?.country ?? "",
            latitude: user.location?.latitude,
            longitude: user.location?.longitude
        )
    }
    // Convert to UpdateUserInput
    public var asInput: API.UpdateUserInput {
        let locationInput = API.LocationInput(
            city: .fromOptional(location.city.isEmpty ? nil : location.city),
            state: .fromOptional(location.state.isEmpty ? nil : location.state),
            country: .fromOptional(location.country.isEmpty ? nil : location.country),
            latitude: .fromOptional(location.latitude),
            longitude: .fromOptional(location.longitude)
        )
        
        let dateString: GraphQLNullable<API.Time>
        if let date = dateOfBirth {
            let isoString = ISO8601DateFormatter().string(from: date)
            dateString = .some(API.Time(isoString))
        } else {
            dateString = .null
        }
        
        // Fix gender conversion
        let genderInput: GraphQLNullable<GraphQLEnum<API.Gender>>
        if let gender = gender {
            genderInput = .some(GraphQLEnum(gender))
        } else {
            genderInput = .null
        }
        
        return API.UpdateUserInput(
            username: .some(username),
            firstName: .some(firstName),
            lastName: .some(lastName),
            gender: genderInput,  // Use the properly wrapped gender
            dateOfBirth: dateString,
            bio: .fromOptional(bio.isEmpty ? nil : bio),
            location: .some(locationInput)
        )
    }
}

extension API.Gender {
    public var displayName: String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        case .nonBinary:
            return "Non Binary"
        }
    }
    
    public static func from(displayString: String) -> API.Gender? {
        // Add debug print
        print("Attempting to parse gender from: \(displayString)")
        switch displayString {
        case "Male":
            print("Matched Male")
            return .male
        case "Female":
            print("Matched Female")
            return .female
        case "Non Binary":
            print("Matched Non Binary")
            return .nonBinary
        default:
            print("No match found")
            return nil
        }
    }
    
    static var allCases: [API.Gender] {
        [.male, .female, .nonBinary]
    }
}

extension GraphQLNullable {
    static func fromOptional<T>(_ value: T?) -> GraphQLNullable<T> {
        if let value = value {
            return .some(value)
        }
        return .null
    }
}
