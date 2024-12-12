// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class FriendshipQuery: GraphQLQuery {
    public static let operationName: String = "Friendship"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query Friendship($friendshipId: ObjectID!) { friendship(id: $friendshipId) { __typename id type status createdAt updatedAt receiverId } }"#
      ))

    public var friendshipId: ObjectID

    public init(friendshipId: ObjectID) {
      self.friendshipId = friendshipId
    }

    public var __variables: Variables? { ["friendshipId": friendshipId] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("friendship", Friendship?.self, arguments: ["id": .variable("friendshipId")]),
      ] }

      public var friendship: Friendship? { __data["friendship"] }

      /// Friendship
      ///
      /// Parent Type: `Friendship`
      public struct Friendship: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.Friendship }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", API.ObjectID.self),
          .field("type", GraphQLEnum<API.RelationshipType>.self),
          .field("status", GraphQLEnum<API.RelationshipStatus>.self),
          .field("createdAt", API.DateTime.self),
          .field("updatedAt", API.DateTime.self),
          .field("receiverId", API.ObjectID.self),
        ] }

        public var id: API.ObjectID { __data["id"] }
        public var type: GraphQLEnum<API.RelationshipType> { __data["type"] }
        public var status: GraphQLEnum<API.RelationshipStatus> { __data["status"] }
        public var createdAt: API.DateTime { __data["createdAt"] }
        public var updatedAt: API.DateTime { __data["updatedAt"] }
        public var receiverId: API.ObjectID { __data["receiverId"] }
      }
    }
  }

}