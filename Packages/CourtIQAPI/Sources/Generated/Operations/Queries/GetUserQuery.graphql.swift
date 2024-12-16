// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class GetUserQuery: GraphQLQuery {
    public static let operationName: String = "GetUser"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetUser($id: ObjectID!) { getUser(id: $id) { __typename ...UserFields } }"#,
        fragments: [UserFields.self]
      ))

    public var id: ObjectID

    public init(id: ObjectID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("getUser", GetUser?.self, arguments: ["id": .variable("id")]),
      ] }

      public var getUser: GetUser? { __data["getUser"] }

      /// GetUser
      ///
      /// Parent Type: `User`
      public struct GetUser: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(UserFields.self),
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
        public var dateOfBirth: API.Time? { __data["dateOfBirth"] }
        public var bio: String? { __data["bio"] }
        public var location: UserFields.Location? { __data["location"] }
        public var rating: Int? { __data["rating"] }
        public var createdAt: API.Time? { __data["createdAt"] }
        public var lastUpdated: API.Time? { __data["lastUpdated"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var userFields: UserFields { _toFragment() }
        }
      }
    }
  }

}