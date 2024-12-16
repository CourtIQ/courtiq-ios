// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class IsUsernameAvailableQuery: GraphQLQuery {
    public static let operationName: String = "IsUsernameAvailable"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query IsUsernameAvailable($username: String!) { isUsernameAvailable(username: $username) }"#
      ))

    public var username: String

    public init(username: String) {
      self.username = username
    }

    public var __variables: Variables? { ["username": username] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("isUsernameAvailable", Bool.self, arguments: ["username": .variable("username")]),
      ] }

      public var isUsernameAvailable: Bool { __data["isUsernameAvailable"] }
    }
  }

}