// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class Mutation: MockObject {
  static let objectType: Object = API.Objects.Mutation
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<Mutation>>

  struct MockFields {
    @Field<TennisString>("assignRacketToString") public var assignRacketToString
    @Field<TennisRacket>("createTennisRacket") public var createTennisRacket
    @Field<TennisString>("createTennisString") public var createTennisString
    @Field<Bool>("deleteMyTennisRacket") public var deleteMyTennisRacket
    @Field<Bool>("deleteMyTennisString") public var deleteMyTennisString
    @Field<Friendship>("sendFriendRequest") public var sendFriendRequest
    @Field<TennisRacket>("updateMyTennisRacket") public var updateMyTennisRacket
    @Field<TennisString>("updateMyTennisString") public var updateMyTennisString
    @Field<User>("updateUser") public var updateUser
  }
}

extension Mock where O == Mutation {
  convenience init(
    assignRacketToString: Mock<TennisString>? = nil,
    createTennisRacket: Mock<TennisRacket>? = nil,
    createTennisString: Mock<TennisString>? = nil,
    deleteMyTennisRacket: Bool? = nil,
    deleteMyTennisString: Bool? = nil,
    sendFriendRequest: Mock<Friendship>? = nil,
    updateMyTennisRacket: Mock<TennisRacket>? = nil,
    updateMyTennisString: Mock<TennisString>? = nil,
    updateUser: Mock<User>? = nil
  ) {
    self.init()
    _setEntity(assignRacketToString, for: \.assignRacketToString)
    _setEntity(createTennisRacket, for: \.createTennisRacket)
    _setEntity(createTennisString, for: \.createTennisString)
    _setScalar(deleteMyTennisRacket, for: \.deleteMyTennisRacket)
    _setScalar(deleteMyTennisString, for: \.deleteMyTennisString)
    _setEntity(sendFriendRequest, for: \.sendFriendRequest)
    _setEntity(updateMyTennisRacket, for: \.updateMyTennisRacket)
    _setEntity(updateMyTennisString, for: \.updateMyTennisString)
    _setEntity(updateUser, for: \.updateUser)
  }
}
