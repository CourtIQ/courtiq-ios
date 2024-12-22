// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class Friendship: MockObject {
  static let objectType: Object = API.Objects.Friendship
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<Friendship>>

  struct MockFields {
    @Field<API.DateTime>("createdAt") public var createdAt
    @Field<API.ObjectID>("id") public var id
    @Field<[API.ObjectID]>("participants") public var participants
    @Field<API.ObjectID>("receiverId") public var receiverId
    @Field<API.ObjectID>("senderId") public var senderId
    @Field<GraphQLEnum<API.RelationshipStatus>>("status") public var status
    @Field<GraphQLEnum<API.RelationshipType>>("type") public var type
    @Field<API.DateTime>("updatedAt") public var updatedAt
  }
}

extension Mock where O == Friendship {
  convenience init(
    createdAt: API.DateTime? = nil,
    id: API.ObjectID? = nil,
    participants: [API.ObjectID]? = nil,
    receiverId: API.ObjectID? = nil,
    senderId: API.ObjectID? = nil,
    status: GraphQLEnum<API.RelationshipStatus>? = nil,
    type: GraphQLEnum<API.RelationshipType>? = nil,
    updatedAt: API.DateTime? = nil
  ) {
    self.init()
    _setScalar(createdAt, for: \.createdAt)
    _setScalar(id, for: \.id)
    _setScalarList(participants, for: \.participants)
    _setScalar(receiverId, for: \.receiverId)
    _setScalar(senderId, for: \.senderId)
    _setScalar(status, for: \.status)
    _setScalar(type, for: \.type)
    _setScalar(updatedAt, for: \.updatedAt)
  }
}
