// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class SentCoachRequestsQuery: GraphQLQuery {
    public static let operationName: String = "SentCoachRequests"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query SentCoachRequests { sentCoachRequests { __typename ...CoachshipFields } }"#,
        fragments: [CoachshipFields.self]
      ))

    public init() {}

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("sentCoachRequests", [SentCoachRequest].self),
      ] }

      public var sentCoachRequests: [SentCoachRequest] { __data["sentCoachRequests"] }

      /// SentCoachRequest
      ///
      /// Parent Type: `Coachship`
      public struct SentCoachRequest: API.SelectionSet {
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