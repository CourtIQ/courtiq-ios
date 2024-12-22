// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class Query: MockObject {
  static let objectType: Object = API.Objects.Query
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<Query>>

  struct MockFields {
    @Field<Coachship>("coachship") public var coachship
    @Field<[Friendship]>("friends") public var friends
    @Field<Friendship>("friendship") public var friendship
    @Field<GraphQLEnum<API.RelationshipStatus>>("friendshipStatus") public var friendshipStatus
    @Field<User>("getUser") public var getUser
    @Field<GraphQLEnum<API.RelationshipStatus>>("isCoach") public var isCoach
    @Field<GraphQLEnum<API.RelationshipStatus>>("isStudent") public var isStudent
    @Field<Bool>("isUsernameAvailable") public var isUsernameAvailable
    @Field<User>("me") public var me
    @Field<[Coachship]>("myCoachRequests") public var myCoachRequests
    @Field<[Coachship]>("myCoaches") public var myCoaches
    @Field<[Equipment]>("myEquipment") public var myEquipment
    @Field<[Friendship]>("myFriendRequests") public var myFriendRequests
    @Field<[Friendship]>("myFriends") public var myFriends
    @Field<[TennisString]>("myStringHistory") public var myStringHistory
    @Field<[Coachship]>("myStudentRequests") public var myStudentRequests
    @Field<[Coachship]>("myStudents") public var myStudents
    @Field<TennisRacket>("myTennisRacket") public var myTennisRacket
    @Field<TennisString>("myTennisString") public var myTennisString
    @Field<[Coachship]>("sentCoachRequests") public var sentCoachRequests
    @Field<[Friendship]>("sentFriendRequests") public var sentFriendRequests
    @Field<[Coachship]>("sentStudentRequests") public var sentStudentRequests
  }
}

extension Mock where O == Query {
  convenience init(
    coachship: Mock<Coachship>? = nil,
    friends: [Mock<Friendship>]? = nil,
    friendship: Mock<Friendship>? = nil,
    friendshipStatus: GraphQLEnum<API.RelationshipStatus>? = nil,
    getUser: Mock<User>? = nil,
    isCoach: GraphQLEnum<API.RelationshipStatus>? = nil,
    isStudent: GraphQLEnum<API.RelationshipStatus>? = nil,
    isUsernameAvailable: Bool? = nil,
    me: Mock<User>? = nil,
    myCoachRequests: [Mock<Coachship>]? = nil,
    myCoaches: [Mock<Coachship>]? = nil,
    myEquipment: [AnyMock]? = nil,
    myFriendRequests: [Mock<Friendship>]? = nil,
    myFriends: [Mock<Friendship>]? = nil,
    myStringHistory: [Mock<TennisString>]? = nil,
    myStudentRequests: [Mock<Coachship>]? = nil,
    myStudents: [Mock<Coachship>]? = nil,
    myTennisRacket: Mock<TennisRacket>? = nil,
    myTennisString: Mock<TennisString>? = nil,
    sentCoachRequests: [Mock<Coachship>]? = nil,
    sentFriendRequests: [Mock<Friendship>]? = nil,
    sentStudentRequests: [Mock<Coachship>]? = nil
  ) {
    self.init()
    _setEntity(coachship, for: \.coachship)
    _setList(friends, for: \.friends)
    _setEntity(friendship, for: \.friendship)
    _setScalar(friendshipStatus, for: \.friendshipStatus)
    _setEntity(getUser, for: \.getUser)
    _setScalar(isCoach, for: \.isCoach)
    _setScalar(isStudent, for: \.isStudent)
    _setScalar(isUsernameAvailable, for: \.isUsernameAvailable)
    _setEntity(me, for: \.me)
    _setList(myCoachRequests, for: \.myCoachRequests)
    _setList(myCoaches, for: \.myCoaches)
    _setList(myEquipment, for: \.myEquipment)
    _setList(myFriendRequests, for: \.myFriendRequests)
    _setList(myFriends, for: \.myFriends)
    _setList(myStringHistory, for: \.myStringHistory)
    _setList(myStudentRequests, for: \.myStudentRequests)
    _setList(myStudents, for: \.myStudents)
    _setEntity(myTennisRacket, for: \.myTennisRacket)
    _setEntity(myTennisString, for: \.myTennisString)
    _setList(sentCoachRequests, for: \.sentCoachRequests)
    _setList(sentFriendRequests, for: \.sentFriendRequests)
    _setList(sentStudentRequests, for: \.sentStudentRequests)
  }
}
