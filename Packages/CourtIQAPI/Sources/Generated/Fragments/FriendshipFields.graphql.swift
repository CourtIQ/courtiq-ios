// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  struct FriendshipFields: API.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString {
      #"fragment FriendshipFields on Friendship { __typename id participants type status createdAt updatedAt senderId receiverId }"#
    }

    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.Friendship }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", API.ObjectID.self),
      .field("participants", [API.ObjectID].self),
      .field("type", GraphQLEnum<API.RelationshipType>.self),
      .field("status", GraphQLEnum<API.RelationshipStatus>.self),
      .field("createdAt", API.DateTime.self),
      .field("updatedAt", API.DateTime.self),
      .field("senderId", API.ObjectID.self),
      .field("receiverId", API.ObjectID.self),
    ] }

    public var id: API.ObjectID { __data["id"] }
    public var participants: [API.ObjectID] { __data["participants"] }
    public var type: GraphQLEnum<API.RelationshipType> { __data["type"] }
    public var status: GraphQLEnum<API.RelationshipStatus> { __data["status"] }
    public var createdAt: API.DateTime { __data["createdAt"] }
    public var updatedAt: API.DateTime { __data["updatedAt"] }
    public var senderId: API.ObjectID { __data["senderId"] }
    public var receiverId: API.ObjectID { __data["receiverId"] }
  }

}