// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class SentFriendRequestsQuery: GraphQLQuery {
    public static let operationName: String = "SentFriendRequests"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query SentFriendRequests { sentFriendRequests { __typename ...FriendshipFields } }"#,
        fragments: [FriendshipFields.self]
      ))

    public init() {}

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("sentFriendRequests", [SentFriendRequest].self),
      ] }

      public var sentFriendRequests: [SentFriendRequest] { __data["sentFriendRequests"] }

      /// SentFriendRequest
      ///
      /// Parent Type: `Friendship`
      public struct SentFriendRequest: API.SelectionSet {
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