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
    @Field<[Equipment]>("myEquipment") public var myEquipment
    @Field<[TennisString]>("myStringHistory") public var myStringHistory
    @Field<TennisRacket>("myTennisRacket") public var myTennisRacket
    @Field<[TennisRacket]>("myTennisRackets") public var myTennisRackets
    @Field<TennisString>("myTennisString") public var myTennisString
    @Field<[TennisString]>("myTennisStrings") public var myTennisStrings
  }
}

extension Mock where O == Query {
  convenience init(
    getUser: Mock<User>? = nil,
    isUsernameAvailable: Bool? = nil,
    me: Mock<User>? = nil,
    myEquipment: [AnyMock]? = nil,
    myStringHistory: [Mock<TennisString>]? = nil,
    myTennisRacket: Mock<TennisRacket>? = nil,
    myTennisRackets: [Mock<TennisRacket>]? = nil,
    myTennisString: Mock<TennisString>? = nil,
    myTennisStrings: [Mock<TennisString>]? = nil
  ) {
    self.init()
    _setEntity(getUser, for: \.getUser)
    _setScalar(isUsernameAvailable, for: \.isUsernameAvailable)
    _setEntity(me, for: \.me)
    _setList(myEquipment, for: \.myEquipment)
    _setList(myStringHistory, for: \.myStringHistory)
    _setEntity(myTennisRacket, for: \.myTennisRacket)
    _setList(myTennisRackets, for: \.myTennisRackets)
    _setEntity(myTennisString, for: \.myTennisString)
    _setList(myTennisStrings, for: \.myTennisStrings)
  }
}
