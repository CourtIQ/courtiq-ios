// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class MyTennisRacketsQuery: GraphQLQuery {
    public static let operationName: String = "MyTennisRackets"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query MyTennisRackets($limit: Int = 10, $offset: Int = 0) { myTennisRackets(limit: $limit, offset: $offset) { __typename ...TennisRacketFields } }"#,
        fragments: [TennisRacketFields.self]
      ))

    public var limit: GraphQLNullable<Int>
    public var offset: GraphQLNullable<Int>

    public init(
      limit: GraphQLNullable<Int> = 10,
      offset: GraphQLNullable<Int> = 0
    ) {
      self.limit = limit
      self.offset = offset
    }

    public var __variables: Variables? { [
      "limit": limit,
      "offset": offset
    ] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("myTennisRackets", [MyTennisRacket].self, arguments: [
          "limit": .variable("limit"),
          "offset": .variable("offset")
        ]),
      ] }

      public var myTennisRackets: [MyTennisRacket] { __data["myTennisRackets"] }

      /// MyTennisRacket
      ///
      /// Parent Type: `TennisRacket`
      public struct MyTennisRacket: API.SelectionSet {
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