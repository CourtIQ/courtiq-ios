// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  struct EquipmentFields: API.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString {
      #"fragment EquipmentFields on Equipment { __typename id ownerId name type createdAt updatedAt }"#
    }

    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { API.Interfaces.Equipment }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", API.ObjectID.self),
      .field("ownerId", API.ObjectID.self),
      .field("name", String.self),
      .field("type", GraphQLEnum<API.EquipmentType>.self),
      .field("createdAt", API.DateTime.self),
      .field("updatedAt", API.DateTime.self),
    ] }

    public var id: API.ObjectID { __data["id"] }
    public var ownerId: API.ObjectID { __data["ownerId"] }
    public var name: String { __data["name"] }
    public var type: GraphQLEnum<API.EquipmentType> { __data["type"] }
    public var createdAt: API.DateTime { __data["createdAt"] }
    public var updatedAt: API.DateTime { __data["updatedAt"] }
  }

}