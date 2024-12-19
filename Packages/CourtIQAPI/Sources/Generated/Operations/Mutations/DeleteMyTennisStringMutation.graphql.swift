// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class DeleteMyTennisStringMutation: GraphQLMutation {
    public static let operationName: String = "DeleteMyTennisString"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation DeleteMyTennisString($deleteMyTennisStringId: ObjectID!) { deleteMyTennisString(id: $deleteMyTennisStringId) }"#
      ))

    public var deleteMyTennisStringId: ObjectID

    public init(deleteMyTennisStringId: ObjectID) {
      self.deleteMyTennisStringId = deleteMyTennisStringId
    }

    public var __variables: Variables? { ["deleteMyTennisStringId": deleteMyTennisStringId] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Mutation }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("deleteMyTennisString", Bool.self, arguments: ["id": .variable("deleteMyTennisStringId")]),
      ] }

      public var deleteMyTennisString: Bool { __data["deleteMyTennisString"] }
    }
  }

}