// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class IsCoachQuery: GraphQLQuery {
    public static let operationName: String = "IsCoach"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query IsCoach($coachId: ObjectID!) { isCoach(coachId: $coachId) }"#
      ))

    public var coachId: ObjectID

    public init(coachId: ObjectID) {
      self.coachId = coachId
    }

    public var __variables: Variables? { ["coachId": coachId] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("isCoach", GraphQLEnum<API.RelationshipStatus>.self, arguments: ["coachId": .variable("coachId")]),
      ] }

      public var isCoach: GraphQLEnum<API.RelationshipStatus> { __data["isCoach"] }
    }
  }

}