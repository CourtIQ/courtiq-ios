// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class FriendsOfUserQuery: GraphQLQuery {
    public static let operationName: String = "FriendsOfUser"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query FriendsOfUser($ofUserID: ObjectID!, $limit: Int = 10, $offset: Int = 0) { friends(ofUserID: $ofUserID, limit: $limit, offset: $offset) { __typename ...FriendshipFields } }"#,
        fragments: [FriendshipFields.self]
      ))

    public var ofUserID: ObjectID
    public var limit: GraphQLNullable<Int>
    public var offset: GraphQLNullable<Int>

    public init(
      ofUserID: ObjectID,
      limit: GraphQLNullable<Int> = 10,
      offset: GraphQLNullable<Int> = 0
    ) {
      self.ofUserID = ofUserID
      self.limit = limit
      self.offset = offset
    }

    public var __variables: Variables? { [
      "ofUserID": ofUserID,
      "limit": limit,
      "offset": offset
    ] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("friends", [Friend].self, arguments: [
          "ofUserID": .variable("ofUserID"),
          "limit": .variable("limit"),
          "offset": .variable("offset")
        ]),
      ] }

      public var friends: [Friend] { __data["friends"] }

      /// Friend
      ///
      /// Parent Type: `Friendship`
      public struct Friend: API.SelectionSet {
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