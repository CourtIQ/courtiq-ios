// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class FriendshipQuery: GraphQLQuery {
    public static let operationName: String = "Friendship"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query Friendship($friendshipId: ID!) { friendship(id: $friendshipId) { __typename id participantIds type status createdAt updatedAt requesterId receiverId } }"#
      ))

    public var friendshipId: ID

    public init(friendshipId: ID) {
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

      /// Retrieve a specific friendship by ID
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
          .field("id", API.ID.self),
          .field("participantIds", [API.ID].self),
          .field("type", GraphQLEnum<API.RelationshipType>.self),
          .field("status", GraphQLEnum<API.RelationshipStatus>.self),
          .field("createdAt", String.self),
          .field("updatedAt", String?.self),
          .field("requesterId", API.ID.self),
          .field("receiverId", API.ID.self),
        ] }

        /// Unique identifier for the friendship
        public var id: API.ID { __data["id"] }
        /// List of IDs for both users in the friendship
        public var participantIds: [API.ID] { __data["participantIds"] }
        /// Type of relationship (always FRIENDSHIP for Friendship)
        public var type: GraphQLEnum<API.RelationshipType> { __data["type"] }
        /// Current status of the friendship
        public var status: GraphQLEnum<API.RelationshipStatus> { __data["status"] }
        /// ISO-8601 formatted timestamp when the friendship was created
        public var createdAt: String { __data["createdAt"] }
        /// ISO-8601 formatted timestamp when the friendship was last updated
        public var updatedAt: String? { __data["updatedAt"] }
        /// ID of the user who initiated the friendship request
        public var requesterId: API.ID { __data["requesterId"] }
        /// ID of the user who received the friendship request
        public var receiverId: API.ID { __data["receiverId"] }
      }
    }
  }

}