// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  struct TennisStringFields: API.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString {
      #"fragment TennisStringFields on TennisString { __typename id ownerId name type createdAt updatedAt racket brand brandId model modelId tension { __typename mains crosses } stringingDate burstDate visibility }"#
    }

    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.TennisString }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", API.ObjectID.self),
      .field("ownerId", API.ObjectID.self),
      .field("name", String.self),
      .field("type", GraphQLEnum<API.EquipmentType>.self),
      .field("createdAt", API.DateTime.self),
      .field("updatedAt", API.DateTime.self),
      .field("racket", API.ObjectID?.self),
      .field("brand", String?.self),
      .field("brandId", Int?.self),
      .field("model", String?.self),
      .field("modelId", Int?.self),
      .field("tension", Tension?.self),
      .field("stringingDate", API.DateTime?.self),
      .field("burstDate", API.DateTime?.self),
      .field("visibility", GraphQLEnum<API.Visibility>?.self),
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
    public var tension: Tension? { __data["tension"] }
    public var stringingDate: API.DateTime? { __data["stringingDate"] }
    public var burstDate: API.DateTime? { __data["burstDate"] }
    public var visibility: GraphQLEnum<API.Visibility>? { __data["visibility"] }

    /// Tension
    ///
    /// Parent Type: `StringTension`
    public struct Tension: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.StringTension }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("mains", Int?.self),
        .field("crosses", Int?.self),
      ] }

      public var mains: Int? { __data["mains"] }
      public var crosses: Int? { __data["crosses"] }
    }
  }

}