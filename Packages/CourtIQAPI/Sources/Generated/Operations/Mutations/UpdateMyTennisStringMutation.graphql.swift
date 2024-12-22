// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class UpdateMyTennisStringMutation: GraphQLMutation {
    public static let operationName: String = "UpdateMyTennisString"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation UpdateMyTennisString($updateMyTennisStringId: ObjectID!, $input: UpdateTennisStringInput!) { updateMyTennisString(id: $updateMyTennisStringId, input: $input) { __typename ...TennisStringFields } }"#,
        fragments: [TennisStringFields.self]
      ))

    public var updateMyTennisStringId: ObjectID
    public var input: UpdateTennisStringInput

    public init(
      updateMyTennisStringId: ObjectID,
      input: UpdateTennisStringInput
    ) {
      self.updateMyTennisStringId = updateMyTennisStringId
      self.input = input
    }

    public var __variables: Variables? { [
      "updateMyTennisStringId": updateMyTennisStringId,
      "input": input
    ] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Mutation }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("updateMyTennisString", UpdateMyTennisString.self, arguments: [
          "id": .variable("updateMyTennisStringId"),
          "input": .variable("input")
        ]),
      ] }

      public var updateMyTennisString: UpdateMyTennisString { __data["updateMyTennisString"] }

      /// UpdateMyTennisString
      ///
      /// Parent Type: `TennisString`
      public struct UpdateMyTennisString: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.TennisString }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(TennisStringFields.self),
        ] }

        public var id: API.ObjectID { __data["id"] }
        public var ownerId: API.ObjectID { __data["ownerId"] }
        public var name: String { __data["name"] }
        public var type: GraphQLEnum<API.EquipmentType> { __data["type"] }
        public var createdAt: API.DateTime { __data["createdAt"] }
        public var updatedAt: API.DateTime { __data["updatedAt"] }
        public var racket: API.ObjectID? { __data["racket"] }
        public var brand: String? { __data["brand"] }
        public var brandId: Int? { __data["brandId"] }
        public var model: String? { __data["model"] }
        public var modelId: Int? { __data["modelId"] }
        public var tension: TennisStringFields.Tension? { __data["tension"] }
        public var stringingDate: API.DateTime? { __data["stringingDate"] }
        public var burstDate: API.DateTime? { __data["burstDate"] }
        public var visibility: GraphQLEnum<API.Visibility>? { __data["visibility"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var tennisStringFields: TennisStringFields { _toFragment() }
        }
      }
    }
  }

}