// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension API {
  struct StringTensionInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      mains: GraphQLNullable<Int> = nil,
      crosses: GraphQLNullable<Int> = nil
    ) {
      __data = InputDict([
        "mains": mains,
        "crosses": crosses
      ])
    }

    public var mains: GraphQLNullable<Int> {
      get { __data["mains"] }
      set { __data["mains"] = newValue }
    }

    public var crosses: GraphQLNullable<Int> {
      get { __data["crosses"] }
      set { __data["crosses"] = newValue }
    }
  }

}