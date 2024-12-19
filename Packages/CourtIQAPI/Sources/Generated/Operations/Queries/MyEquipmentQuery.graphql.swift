// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class MyEquipmentQuery: GraphQLQuery {
    public static let operationName: String = "MyEquipment"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query MyEquipment($limit: Int = 10, $offset: Int = 0) { myEquipment(limit: $limit, offset: $offset) { __typename ...FullEquipmentFields } }"#,
        fragments: [FullEquipmentFields.self, EquipmentFields.self, TennisRacketFields.self, TennisStringFields.self]
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
        .field("myEquipment", [MyEquipment].self, arguments: [
          "limit": .variable("limit"),
          "offset": .variable("offset")
        ]),
      ] }

      public var myEquipment: [MyEquipment] { __data["myEquipment"] }

      /// MyEquipment
      ///
      /// Parent Type: `Equipment`
      public struct MyEquipment: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Interfaces.Equipment }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(FullEquipmentFields.self),
        ] }

        public var id: API.ObjectID { __data["id"] }
        public var ownerId: API.ObjectID { __data["ownerId"] }
        public var name: String { __data["name"] }
        public var type: GraphQLEnum<API.EquipmentType> { __data["type"] }
        public var createdAt: API.DateTime { __data["createdAt"] }
        public var updatedAt: API.DateTime { __data["updatedAt"] }

        public var asTennisRacket: AsTennisRacket? { _asInlineFragment() }
        public var asTennisString: AsTennisString? { _asInlineFragment() }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var fullEquipmentFields: FullEquipmentFields { _toFragment() }
          public var equipmentFields: EquipmentFields { _toFragment() }
        }

        /// MyEquipment.AsTennisRacket
        ///
        /// Parent Type: `TennisRacket`
        public struct AsTennisRacket: API.InlineFragment, ApolloAPI.CompositeInlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = MyEquipmentQuery.Data.MyEquipment
          public static var __parentType: ApolloAPI.ParentType { API.Objects.TennisRacket }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            EquipmentFields.self,
            FullEquipmentFields.self,
            MyEquipmentQuery.Data.MyEquipment.self,
            TennisRacketFields.self,
            FullEquipmentFields.AsTennisRacket.self
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

            public var equipmentFields: EquipmentFields { _toFragment() }
            public var fullEquipmentFields: FullEquipmentFields { _toFragment() }
            public var tennisRacketFields: TennisRacketFields { _toFragment() }
          }
        }

        /// MyEquipment.AsTennisString
        ///
        /// Parent Type: `TennisString`
        public struct AsTennisString: API.InlineFragment, ApolloAPI.CompositeInlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = MyEquipmentQuery.Data.MyEquipment
          public static var __parentType: ApolloAPI.ParentType { API.Objects.TennisString }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            EquipmentFields.self,
            FullEquipmentFields.self,
            MyEquipmentQuery.Data.MyEquipment.self,
            TennisStringFields.self,
            FullEquipmentFields.AsTennisString.self
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

            public var equipmentFields: EquipmentFields { _toFragment() }
            public var fullEquipmentFields: FullEquipmentFields { _toFragment() }
            public var tennisStringFields: TennisStringFields { _toFragment() }
          }
        }
      }
    }
  }

}