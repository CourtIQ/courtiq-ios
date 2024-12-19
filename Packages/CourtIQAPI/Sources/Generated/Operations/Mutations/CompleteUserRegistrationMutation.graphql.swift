// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class CompleteUserRegistrationMutation: GraphQLMutation {
    public static let operationName: String = "CompleteUserRegistration"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation CompleteUserRegistration($input: UpdateUserInput!) { updateUser(input: $input) { __typename ...UserFields } }"#,
        fragments: [UserFields.self]
      ))

    public var input: UpdateUserInput

    public init(input: UpdateUserInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Mutation }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("updateUser", UpdateUser?.self, arguments: ["input": .variable("input")]),
      ] }

      public var updateUser: UpdateUser? { __data["updateUser"] }

      /// UpdateUser
      ///
      /// Parent Type: `User`
      public struct UpdateUser: API.SelectionSet {
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