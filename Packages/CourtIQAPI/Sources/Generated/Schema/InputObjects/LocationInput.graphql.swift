// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension API {
  struct LocationInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      city: GraphQLNullable<String> = nil,
      state: GraphQLNullable<String> = nil,
      country: GraphQLNullable<String> = nil,
      latitude: GraphQLNullable<Double> = nil,
      longitude: GraphQLNullable<Double> = nil
    ) {
      __data = InputDict([
        "city": city,
        "state": state,
        "country": country,
        "latitude": latitude,
        "longitude": longitude
      ])
    }

    public var city: GraphQLNullable<String> {
      get { __data["city"] }
      set { __data["city"] = newValue }
    }

    public var state: GraphQLNullable<String> {
      get { __data["state"] }
      set { __data["state"] = newValue }
    }

    public var country: GraphQLNullable<String> {
      get { __data["country"] }
      set { __data["country"] = newValue }
    }

    public var latitude: GraphQLNullable<Double> {
      get { __data["latitude"] }
      set { __data["latitude"] = newValue }
    }

    public var longitude: GraphQLNullable<Double> {
      get { __data["longitude"] }
      set { __data["longitude"] = newValue }
    }
  }

}