// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class FriendshipStatusQuery: GraphQLQuery {
    public static let operationName: String = "FriendshipStatus"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query FriendshipStatus($otherUserId: ObjectID!) { friendshipStatus(otherUserId: $otherUserId) }"#
      ))

    public var otherUserId: ObjectID

    public init(otherUserId: ObjectID) {
      self.otherUserId = otherUserId
    }

    public var __variables: Variables? { ["otherUserId": otherUserId] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("friendshipStatus", GraphQLEnum<API.RelationshipStatus>.self, arguments: ["otherUserId": .variable("otherUserId")]),
      ] }

      public var friendshipStatus: GraphQLEnum<API.RelationshipStatus> { __data["friendshipStatus"] }
    }
  }

}