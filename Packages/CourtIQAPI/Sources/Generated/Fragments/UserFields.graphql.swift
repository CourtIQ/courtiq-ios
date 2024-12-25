// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  struct UserFields: API.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString {
      #"fragment UserFields on User { __typename id firebaseId email firstName lastName displayName username gender profilePicture dateOfBirth bio location { __typename city state country latitude longitude } rating createdAt lastUpdated }"#
    }

    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", API.ObjectID.self),
      .field("firebaseId", String.self),
      .field("email", String.self),
      .field("firstName", String?.self),
      .field("lastName", String?.self),
      .field("displayName", String?.self),
      .field("username", String?.self),
      .field("gender", GraphQLEnum<API.Gender>?.self),
      .field("profilePicture", String?.self),
      .field("dateOfBirth", API.DateTime?.self),
      .field("bio", String?.self),
      .field("location", Location?.self),
      .field("rating", Int?.self),
      .field("createdAt", API.DateTime?.self),
      .field("lastUpdated", API.DateTime?.self),
    ] }

    public var id: API.ObjectID { __data["id"] }
    public var firebaseId: String { __data["firebaseId"] }
    public var email: String { __data["email"] }
    public var firstName: String? { __data["firstName"] }
    public var lastName: String? { __data["lastName"] }
    public var displayName: String? { __data["displayName"] }
    public var username: String? { __data["username"] }
    public var gender: GraphQLEnum<API.Gender>? { __data["gender"] }
    public var profilePicture: String? { __data["profilePicture"] }
    public var dateOfBirth: API.DateTime? { __data["dateOfBirth"] }
    public var bio: String? { __data["bio"] }
    public var location: Location? { __data["location"] }
    public var rating: Int? { __data["rating"] }
    public var createdAt: API.DateTime? { __data["createdAt"] }
    public var lastUpdated: API.DateTime? { __data["lastUpdated"] }

    /// Location
    ///
    /// Parent Type: `Location`
    public struct Location: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Location }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("city", String?.self),
        .field("state", String?.self),
        .field("country", String?.self),
        .field("latitude", Double?.self),
        .field("longitude", Double?.self),
      ] }

      public var city: String? { __data["city"] }
      public var state: String? { __data["state"] }
      public var country: String? { __data["country"] }
      public var latitude: Double? { __data["latitude"] }
      public var longitude: Double? { __data["longitude"] }
    }
  }

}