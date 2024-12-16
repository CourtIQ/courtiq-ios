// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class Mutation: MockObject {
  static let objectType: Object = API.Objects.Mutation
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<Mutation>>

  struct MockFields {
    @Field<Friendship>("sendFriendRequest") public var sendFriendRequest
    @Field<User>("updateUser") public var updateUser
  }
}

extension Mock where O == Mutation {
  convenience init(
    sendFriendRequest: Mock<Friendship>? = nil,
    updateUser: Mock<User>? = nil
  ) {
    self.init()
    _setEntity(sendFriendRequest, for: \.sendFriendRequest)
    _setEntity(updateUser, for: \.updateUser)
  }
}
