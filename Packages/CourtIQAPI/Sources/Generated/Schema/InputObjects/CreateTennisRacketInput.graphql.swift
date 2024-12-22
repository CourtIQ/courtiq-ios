// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension API {
  struct CreateTennisRacketInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      name: String,
      brand: GraphQLNullable<String> = nil,
      brandId: GraphQLNullable<Int> = nil,
      model: GraphQLNullable<String> = nil,
      modelId: GraphQLNullable<Int> = nil,
      weight: GraphQLNullable<Double> = nil,
      visibility: GraphQLNullable<GraphQLEnum<Visibility>> = nil
    ) {
      __data = InputDict([
        "name": name,
        "brand": brand,
        "brandId": brandId,
        "model": model,
        "modelId": modelId,
        "weight": weight,
        "visibility": visibility
      ])
    }

    public var name: String {
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

    public var weight: GraphQLNullable<Double> {
      get { __data["weight"] }
      set { __data["weight"] = newValue }
    }

    public var visibility: GraphQLNullable<GraphQLEnum<Visibility>> {
      get { __data["visibility"] }
      set { __data["visibility"] = newValue }
    }
  }

}