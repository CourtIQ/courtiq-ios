// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension API {
  struct UpdateTennisStringInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      name: GraphQLNullable<String> = nil,
      brand: GraphQLNullable<String> = nil,
      brandId: GraphQLNullable<Int> = nil,
      model: GraphQLNullable<String> = nil,
      modelId: GraphQLNullable<Int> = nil,
      tension: GraphQLNullable<StringTensionInput> = nil,
      stringingDate: GraphQLNullable<DateTime> = nil,
      burstDate: GraphQLNullable<DateTime> = nil
    ) {
      __data = InputDict([
        "name": name,
        "brand": brand,
        "brandId": brandId,
        "model": model,
        "modelId": modelId,
        "tension": tension,
        "stringingDate": stringingDate,
        "burstDate": burstDate
      ])
    }

    public var name: GraphQLNullable<String> {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }

    public var brand: GraphQLNullable<String> {
      get { __data["brand"] }
      set { __data["brand"] = newValue }
    }

    public var brandId: GraphQLNullable<Int> {
      get { __data["brandId"] }
      set { __data["brandId"] = newValue }
    }

    public var model: GraphQLNullable<String> {
      get { __data["model"] }
      set { __data["model"] = newValue }
    }

    public var modelId: GraphQLNullable<Int> {
      get { __data["modelId"] }
      set { __data["modelId"] = newValue }
    }

    public var tension: GraphQLNullable<StringTensionInput> {
      get { __data["tension"] }
      set { __data["tension"] = newValue }
    }

    public var stringingDate: GraphQLNullable<DateTime> {
      get { __data["stringingDate"] }
      set { __data["stringingDate"] = newValue }
    }

    public var burstDate: GraphQLNullable<DateTime> {
      get { __data["burstDate"] }
      set { __data["burstDate"] = newValue }
    }
  }

}