// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class RejectCoachRequestMutation: GraphQLMutation {
    public static let operationName: String = "RejectCoachRequest"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation RejectCoachRequest($coachshipId: ObjectID!) { rejectCoachRequest(coachshipId: $coachshipId) { __typename ...CoachshipFields } }"#,
        fragments: [CoachshipFields.self]
      ))

    public var coachshipId: ObjectID

    public init(coachshipId: ObjectID) {
      self.coachshipId = coachshipId
    }

    public var __variables: Variables? { ["coachshipId": coachshipId] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Mutation }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("rejectCoachRequest", RejectCoachRequest.self, arguments: ["coachshipId": .variable("coachshipId")]),
      ] }

      public var rejectCoachRequest: RejectCoachRequest { __data["rejectCoachRequest"] }

      /// RejectCoachRequest
      ///
      /// Parent Type: `Coachship`
      public struct RejectCoachRequest: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.Coachship }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(CoachshipFields.self),
        ] }

        public var id: API.ObjectID { __data["id"] }
        public var participants: [API.ObjectID] { __data["participants"] }
        public var type: GraphQLEnum<API.RelationshipType> { __data["type"] }
        public var status: GraphQLEnum<API.RelationshipStatus> { __data["status"] }
        public var createdAt: API.DateTime { __data["createdAt"] }
        public var updatedAt: API.DateTime { __data["updatedAt"] }
        public var coachId: API.ObjectID { __data["coachId"] }
        public var studentId: API.ObjectID { __data["studentId"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var coachshipFields: CoachshipFields { _toFragment() }
        }
      }
    }
  }

}