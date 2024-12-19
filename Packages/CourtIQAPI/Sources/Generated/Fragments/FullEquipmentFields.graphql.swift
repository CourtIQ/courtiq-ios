// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  struct FullEquipmentFields: API.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString {
      #"fragment FullEquipmentFields on Equipment { __typename ...EquipmentFields ... on TennisRacket { ...TennisRacketFields } ... on TennisString { ...TennisStringFields } }"#
    }

    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { API.Interfaces.Equipment }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .inlineFragment(AsTennisRacket.self),
      .inlineFragment(AsTennisString.self),
      .fragment(EquipmentFields.self),
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

      public var equipmentFields: EquipmentFields { _toFragment() }
    }

    /// AsTennisRacket
    ///
    /// Parent Type: `TennisRacket`
    public struct AsTennisRacket: API.InlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = FullEquipmentFields
      public static var __parentType: ApolloAPI.ParentType { API.Objects.TennisRacket }
      public static var __selections: [ApolloAPI.Selection] { [
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
        public var equipmentFields: EquipmentFields { _toFragment() }
      }
    }

    /// AsTennisString
    ///
    /// Parent Type: `TennisString`
    public struct AsTennisString: API.InlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = FullEquipmentFields
      public static var __parentType: ApolloAPI.ParentType { API.Objects.TennisString }
      public static var __selections: [ApolloAPI.Selection] { [
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
        public var equipmentFields: EquipmentFields { _toFragment() }
      }
    }
  }

}