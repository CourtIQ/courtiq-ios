// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension API {
  class IsStudentQuery: GraphQLQuery {
    public static let operationName: String = "IsStudent"
    public static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query IsStudent($studentId: ObjectID!) { isStudent(studentId: $studentId) }"#
      ))

    public var studentId: ObjectID

    public init(studentId: ObjectID) {
      self.studentId = studentId
    }

    public var __variables: Variables? { ["studentId": studentId] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("isStudent", GraphQLEnum<API.RelationshipStatus>.self, arguments: ["studentId": .variable("studentId")]),
      ] }

      public var isStudent: GraphQLEnum<API.RelationshipStatus> { __data["isStudent"] }
    }
  }

}