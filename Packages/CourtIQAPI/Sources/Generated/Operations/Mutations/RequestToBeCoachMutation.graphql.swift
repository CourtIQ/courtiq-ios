// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class RequestToBeCoachMutation: GraphQLMutation {
    public static let operationName: String = "RequestToBeCoach"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation RequestToBeCoach($ofUserId: ObjectID!) { requestToBeCoach(ofUserId: $ofUserId) { __typename ...CoachshipFields } }"#,
        fragments: [CoachshipFields.self]
      ))

    public var ofUserId: ObjectID

    public init(ofUserId: ObjectID) {
      self.ofUserId = ofUserId
    }

    public var __variables: Variables? { ["ofUserId": ofUserId] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Mutation }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("requestToBeCoach", RequestToBeCoach.self, arguments: ["ofUserId": .variable("ofUserId")]),
      ] }

      public var requestToBeCoach: RequestToBeCoach { __data["requestToBeCoach"] }

      /// RequestToBeCoach
      ///
      /// Parent Type: `Coachship`
      public struct RequestToBeCoach: API.SelectionSet {
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