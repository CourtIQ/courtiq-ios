// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class Friendship: MockObject {
  static let objectType: Object = API.Objects.Friendship
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<Friendship>>

  struct MockFields {
    @Field<API.ObjectID>("receiverId") public var receiverId
    @Field<API.ObjectID>("senderId") public var senderId
  }
}

extension Mock where O == Friendship {
  convenience init(
    receiverId: API.ObjectID? = nil,
    senderId: API.ObjectID? = nil
  ) {
    self.init()
    _setScalar(receiverId, for: \.receiverId)
    _setScalar(senderId, for: \.senderId)
  }
}
