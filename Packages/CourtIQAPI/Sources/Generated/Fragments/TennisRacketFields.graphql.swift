// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  struct TennisRacketFields: API.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString {
      #"fragment TennisRacketFields on TennisRacket { __typename id ownerId name type createdAt updatedAt currentStringId brand brandId model modelId weight visibility }"#
    }

    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.TennisRacket }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", API.ObjectID.self),
      .field("ownerId", API.ObjectID.self),
      .field("name", String.self),
      .field("type", GraphQLEnum<API.EquipmentType>.self),
      .field("createdAt", API.DateTime.self),
      .field("updatedAt", API.DateTime.self),
      .field("currentStringId", API.ObjectID?.self),
      .field("brand", String?.self),
      .field("brandId", Int?.self),
      .field("model", String?.self),
      .field("modelId", Int?.self),
      .field("weight", Double?.self),
      .field("visibility", GraphQLEnum<API.Visibility>?.self),
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
    public var visibility: GraphQLEnum<API.Visibility>? { __data["visibility"] }
  }

}