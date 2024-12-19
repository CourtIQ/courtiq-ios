// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class DeleteMyTennisRacketMutation: GraphQLMutation {
    public static let operationName: String = "DeleteMyTennisRacket"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation DeleteMyTennisRacket($deleteMyTennisRacketId: ObjectID!) { deleteMyTennisRacket(id: $deleteMyTennisRacketId) }"#
      ))

    public var deleteMyTennisRacketId: ObjectID

    public init(deleteMyTennisRacketId: ObjectID) {
      self.deleteMyTennisRacketId = deleteMyTennisRacketId
    }

    public var __variables: Variables? { ["deleteMyTennisRacketId": deleteMyTennisRacketId] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Mutation }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("deleteMyTennisRacket", Bool.self, arguments: ["id": .variable("deleteMyTennisRacketId")]),
      ] }

      public var deleteMyTennisRacket: Bool { __data["deleteMyTennisRacket"] }
    }
  }

}