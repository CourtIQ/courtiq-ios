// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class MyTennisStringQuery: GraphQLQuery {
    public static let operationName: String = "MyTennisString"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query MyTennisString($id: ObjectID!) { myTennisString(id: $id) { __typename ...TennisStringFields } }"#,
        fragments: [TennisStringFields.self]
      ))

    public var id: ObjectID

    public init(id: ObjectID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("myTennisString", MyTennisString?.self, arguments: ["id": .variable("id")]),
      ] }

      public var myTennisString: MyTennisString? { __data["myTennisString"] }

      /// MyTennisString
      ///
      /// Parent Type: `TennisString`
      public struct MyTennisString: API.SelectionSet {
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

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var tennisStringFields: TennisStringFields { _toFragment() }
        }
      }
    }
  }

}