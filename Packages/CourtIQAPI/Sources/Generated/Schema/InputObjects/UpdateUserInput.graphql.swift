// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension API {
  struct UpdateUserInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      username: GraphQLNullable<String> = nil,
      firstName: GraphQLNullable<String> = nil,
      lastName: GraphQLNullable<String> = nil,
      gender: GraphQLNullable<GraphQLEnum<Gender>> = nil,
      dateOfBirth: GraphQLNullable<DateTime> = nil,
      bio: GraphQLNullable<String> = nil,
      location: GraphQLNullable<LocationInput> = nil
    ) {
      __data = InputDict([
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "dateOfBirth": dateOfBirth,
        "bio": bio,
        "location": location
      ])
    }

    public var username: GraphQLNullable<String> {
      get { __data["username"] }
      set { __data["username"] = newValue }
    }

    public var firstName: GraphQLNullable<String> {
      get { __data["firstName"] }
      set { __data["firstName"] = newValue }
    }

    public var lastName: GraphQLNullable<String> {
      get { __data["lastName"] }
      set { __data["lastName"] = newValue }
    }

    public var gender: GraphQLNullable<GraphQLEnum<Gender>> {
      get { __data["gender"] }
      set { __data["gender"] = newValue }
    }

    public var dateOfBirth: GraphQLNullable<DateTime> {
      get { __data["dateOfBirth"] }
      set { __data["dateOfBirth"] = newValue }
    }

    public var bio: GraphQLNullable<String> {
      get { __data["bio"] }
      set { __data["bio"] = newValue }
    }

    public var location: GraphQLNullable<LocationInput> {
      get { __data["location"] }
      set { __data["location"] = newValue }
    }
  }

}