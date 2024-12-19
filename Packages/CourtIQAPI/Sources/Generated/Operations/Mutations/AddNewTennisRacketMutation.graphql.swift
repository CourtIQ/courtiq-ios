// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class AddNewTennisRacketMutation: GraphQLMutation {
    public static let operationName: String = "AddNewTennisRacket"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation AddNewTennisRacket($input: CreateTennisRacketInput!) { createTennisRacket(input: $input) { __typename ...TennisRacketFields } }"#,
        fragments: [TennisRacketFields.self]
      ))

    public var input: CreateTennisRacketInput

    public init(input: CreateTennisRacketInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Mutation }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("createTennisRacket", CreateTennisRacket.self, arguments: ["input": .variable("input")]),
      ] }

      public var createTennisRacket: CreateTennisRacket { __data["createTennisRacket"] }

      /// CreateTennisRacket
      ///
      /// Parent Type: `TennisRacket`
      public struct CreateTennisRacket: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.TennisRacket }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(TennisRacketFields.self),
        ] }

        public var id: API.ObjectID { __data["id"] }
        public var ownerId: API.ObjectID { __data["ownerId"] }
        public var name: String { __data["name"] }
        public var type: GraphQLEnum<API.EquipmentType> { __data["type"] }
        public var createdAt: API.DateTime { __data["createdAt"] }
        public var updatedAt: API.DateTime { __data["updatedAt"] }
        public var currentStringId: API.ObjectID? { __data["currentStringId"] }
        public var brand: String? { __data["brand"] }
        public var brandId: Int? { __data["brandId"] }
        public var model: String? { __data["model"] }
        public var modelId: Int? { __data["modelId"] }
        public var weight: Double? { __data["weight"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var tennisRacketFields: TennisRacketFields { _toFragment() }
        }
      }
    }
  }

}