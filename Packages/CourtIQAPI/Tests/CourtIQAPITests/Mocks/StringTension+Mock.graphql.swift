// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class StringTension: MockObject {
  static let objectType: Object = API.Objects.StringTension
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<StringTension>>

  struct MockFields {
    @Field<Int>("crosses") public var crosses
    @Field<Int>("mains") public var mains
  }
}

extension Mock where O == StringTension {
  convenience init(
    crosses: Int? = nil,
    mains: Int? = nil
  ) {
    self.init()
    _setScalar(crosses, for: \.crosses)
    _setScalar(mains, for: \.mains)
  }
}
