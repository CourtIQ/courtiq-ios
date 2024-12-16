// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class Query: MockObject {
  static let objectType: Object = API.Objects.Query
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<Query>>

  struct MockFields {
    @Field<User>("getUser") public var getUser
    @Field<Bool>("isUsernameAvailable") public var isUsernameAvailable
    @Field<User>("me") public var me
  }
}

extension Mock where O == Query {
  convenience init(
    getUser: Mock<User>? = nil,
    isUsernameAvailable: Bool? = nil,
    me: Mock<User>? = nil
  ) {
    self.init()
    _setEntity(getUser, for: \.getUser)
    _setScalar(isUsernameAvailable, for: \.isUsernameAvailable)
    _setEntity(me, for: \.me)
  }
}
