// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class Coachship: MockObject {
  static let objectType: Object = API.Objects.Coachship
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<Coachship>>

  struct MockFields {
    @Field<API.ObjectID>("coachId") public var coachId
    @Field<API.DateTime>("createdAt") public var createdAt
    @Field<API.ObjectID>("id") public var id
    @Field<[API.ObjectID]>("participants") public var participants
    @Field<GraphQLEnum<API.RelationshipStatus>>("status") public var status
    @Field<API.ObjectID>("studentId") public var studentId
    @Field<GraphQLEnum<API.RelationshipType>>("type") public var type
    @Field<API.DateTime>("updatedAt") public var updatedAt
  }
}

extension Mock where O == Coachship {
  convenience init(
    coachId: API.ObjectID? = nil,
    createdAt: API.DateTime? = nil,
    id: API.ObjectID? = nil,
    participants: [API.ObjectID]? = nil,
    status: GraphQLEnum<API.RelationshipStatus>? = nil,
    studentId: API.ObjectID? = nil,
    type: GraphQLEnum<API.RelationshipType>? = nil,
    updatedAt: API.DateTime? = nil
  ) {
    self.init()
    _setScalar(coachId, for: \.coachId)
    _setScalar(createdAt, for: \.createdAt)
    _setScalar(id, for: \.id)
    _setScalarList(participants, for: \.participants)
    _setScalar(status, for: \.status)
    _setScalar(studentId, for: \.studentId)
    _setScalar(type, for: \.type)
    _setScalar(updatedAt, for: \.updatedAt)
  }
}
