// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class Mutation: MockObject {
  static let objectType: Object = API.Objects.Mutation
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<Mutation>>

  struct MockFields {
    @Field<Coachship>("acceptCoachRequest") public var acceptCoachRequest
    @Field<Friendship>("acceptFriendRequest") public var acceptFriendRequest
    @Field<Coachship>("acceptStudentRequest") public var acceptStudentRequest
    @Field<TennisString>("assignRacketToString") public var assignRacketToString
    @Field<Coachship>("cancelCoachRequest") public var cancelCoachRequest
    @Field<Friendship>("cancelFriendRequest") public var cancelFriendRequest
    @Field<Coachship>("cancelRequestToBeStudent") public var cancelRequestToBeStudent
    @Field<TennisRacket>("createTennisRacket") public var createTennisRacket
    @Field<TennisString>("createTennisString") public var createTennisString
    @Field<Bool>("deleteMyTennisRacket") public var deleteMyTennisRacket
    @Field<Bool>("deleteMyTennisString") public var deleteMyTennisString
    @Field<Friendship>("endFriendship") public var endFriendship
    @Field<Coachship>("rejectCoachRequest") public var rejectCoachRequest
    @Field<Friendship>("rejectFriendRequest") public var rejectFriendRequest
    @Field<Coachship>("rejectStudentRequest") public var rejectStudentRequest
    @Field<Coachship>("removeCoach") public var removeCoach
    @Field<Coachship>("removeStudent") public var removeStudent
    @Field<Coachship>("requestToBeCoach") public var requestToBeCoach
    @Field<Coachship>("requestToBeStudent") public var requestToBeStudent
    @Field<Friendship>("sendFriendRequest") public var sendFriendRequest
    @Field<TennisRacket>("updateMyTennisRacket") public var updateMyTennisRacket
    @Field<TennisString>("updateMyTennisString") public var updateMyTennisString
    @Field<User>("updateUser") public var updateUser
  }
}

extension Mock where O == Mutation {
  convenience init(
    acceptCoachRequest: Mock<Coachship>? = nil,
    acceptFriendRequest: Mock<Friendship>? = nil,
    acceptStudentRequest: Mock<Coachship>? = nil,
    assignRacketToString: Mock<TennisString>? = nil,
    cancelCoachRequest: Mock<Coachship>? = nil,
    cancelFriendRequest: Mock<Friendship>? = nil,
    cancelRequestToBeStudent: Mock<Coachship>? = nil,
    createTennisRacket: Mock<TennisRacket>? = nil,
    createTennisString: Mock<TennisString>? = nil,
    deleteMyTennisRacket: Bool? = nil,
    deleteMyTennisString: Bool? = nil,
    endFriendship: Mock<Friendship>? = nil,
    rejectCoachRequest: Mock<Coachship>? = nil,
    rejectFriendRequest: Mock<Friendship>? = nil,
    rejectStudentRequest: Mock<Coachship>? = nil,
    removeCoach: Mock<Coachship>? = nil,
    removeStudent: Mock<Coachship>? = nil,
    requestToBeCoach: Mock<Coachship>? = nil,
    requestToBeStudent: Mock<Coachship>? = nil,
    sendFriendRequest: Mock<Friendship>? = nil,
    updateMyTennisRacket: Mock<TennisRacket>? = nil,
    updateMyTennisString: Mock<TennisString>? = nil,
    updateUser: Mock<User>? = nil
  ) {
    self.init()
    _setEntity(acceptCoachRequest, for: \.acceptCoachRequest)
    _setEntity(acceptFriendRequest, for: \.acceptFriendRequest)
    _setEntity(acceptStudentRequest, for: \.acceptStudentRequest)
    _setEntity(assignRacketToString, for: \.assignRacketToString)
    _setEntity(cancelCoachRequest, for: \.cancelCoachRequest)
    _setEntity(cancelFriendRequest, for: \.cancelFriendRequest)
    _setEntity(cancelRequestToBeStudent, for: \.cancelRequestToBeStudent)
    _setEntity(createTennisRacket, for: \.createTennisRacket)
    _setEntity(createTennisString, for: \.createTennisString)
    _setScalar(deleteMyTennisRacket, for: \.deleteMyTennisRacket)
    _setScalar(deleteMyTennisString, for: \.deleteMyTennisString)
    _setEntity(endFriendship, for: \.endFriendship)
    _setEntity(rejectCoachRequest, for: \.rejectCoachRequest)
    _setEntity(rejectFriendRequest, for: \.rejectFriendRequest)
    _setEntity(rejectStudentRequest, for: \.rejectStudentRequest)
    _setEntity(removeCoach, for: \.removeCoach)
    _setEntity(removeStudent, for: \.removeStudent)
    _setEntity(requestToBeCoach, for: \.requestToBeCoach)
    _setEntity(requestToBeStudent, for: \.requestToBeStudent)
    _setEntity(sendFriendRequest, for: \.sendFriendRequest)
    _setEntity(updateMyTennisRacket, for: \.updateMyTennisRacket)
    _setEntity(updateMyTennisString, for: \.updateMyTennisString)
    _setEntity(updateUser, for: \.updateUser)
  }
}
