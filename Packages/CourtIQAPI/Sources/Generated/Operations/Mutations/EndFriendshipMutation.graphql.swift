// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class EndFriendshipMutation: GraphQLMutation {
    public static let operationName: String = "EndFriendship"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation EndFriendship($friendshipId: ObjectID!) { endFriendship(friendshipId: $friendshipId) { __typename ...FriendshipFields } }"#,
        fragments: [FriendshipFields.self]
      ))

    public var friendshipId: ObjectID

    public init(friendshipId: ObjectID) {
      self.friendshipId = friendshipId
    }

    public var __variables: Variables? { ["friendshipId": friendshipId] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Mutation }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("endFriendship", EndFriendship.self, arguments: ["friendshipId": .variable("friendshipId")]),
      ] }

      public var endFriendship: EndFriendship { __data["endFriendship"] }

      /// EndFriendship
      ///
      /// Parent Type: `Friendship`
      public struct EndFriendship: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.Friendship }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(FriendshipFields.self),
        ] }

        public var id: API.ObjectID { __data["id"] }
        public var participants: [API.ObjectID] { __data["participants"] }
        public var type: GraphQLEnum<API.RelationshipType> { __data["type"] }
        public var status: GraphQLEnum<API.RelationshipStatus> { __data["status"] }
        public var createdAt: API.DateTime { __data["createdAt"] }
        public var updatedAt: API.DateTime { __data["updatedAt"] }
        public var senderId: API.ObjectID { __data["senderId"] }
        public var receiverId: API.ObjectID { __data["receiverId"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var friendshipFields: FriendshipFields { _toFragment() }
        }
      }
    }
  }

}