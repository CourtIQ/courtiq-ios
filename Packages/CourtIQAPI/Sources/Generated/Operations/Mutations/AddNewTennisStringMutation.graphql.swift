// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class AddNewTennisStringMutation: GraphQLMutation {
    public static let operationName: String = "AddNewTennisString"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation AddNewTennisString($input: CreateTennisStringInput!) { createTennisString(input: $input) { __typename ...TennisStringFields } }"#,
        fragments: [TennisStringFields.self]
      ))

    public var input: CreateTennisStringInput

    public init(input: CreateTennisStringInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Mutation }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("createTennisString", CreateTennisString.self, arguments: ["input": .variable("input")]),
      ] }

      public var createTennisString: CreateTennisString { __data["createTennisString"] }

      /// CreateTennisString
      ///
      /// Parent Type: `TennisString`
      public struct CreateTennisString: API.SelectionSet {
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