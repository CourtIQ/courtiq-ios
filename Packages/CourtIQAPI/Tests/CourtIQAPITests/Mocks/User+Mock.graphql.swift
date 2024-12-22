// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class User: MockObject {
  static let objectType: Object = API.Objects.User
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<User>>

  struct MockFields {
    @Field<String>("bio") public var bio
    @Field<API.Time>("createdAt") public var createdAt
    @Field<API.Time>("dateOfBirth") public var dateOfBirth
    @Field<String>("displayName") public var displayName
    @Field<String>("email") public var email
    @Field<String>("firebaseId") public var firebaseId
    @Field<String>("firstName") public var firstName
    @Field<GraphQLEnum<API.Gender>>("gender") public var gender
    @Field<API.ObjectID>("id") public var id
    @Field<String>("lastName") public var lastName
    @Field<API.Time>("lastUpdated") public var lastUpdated
    @Field<Location>("location") public var location
    @Field<[TennisRacket]>("myTennisRackets") public var myTennisRackets
    @Field<[TennisString]>("myTennisStrings") public var myTennisStrings
    @Field<String>("profilePicture") public var profilePicture
    @Field<Int>("rating") public var rating
    @Field<String>("username") public var username
  }
}

extension Mock where O == User {
  convenience init(
    bio: String? = nil,
    createdAt: API.Time? = nil,
    dateOfBirth: API.Time? = nil,
    displayName: String? = nil,
    email: String? = nil,
    firebaseId: String? = nil,
    firstName: String? = nil,
    gender: GraphQLEnum<API.Gender>? = nil,
    id: API.ObjectID? = nil,
    lastName: String? = nil,
    lastUpdated: API.Time? = nil,
    location: Mock<Location>? = nil,
    myTennisRackets: [Mock<TennisRacket>]? = nil,
    myTennisStrings: [Mock<TennisString>]? = nil,
    profilePicture: String? = nil,
    rating: Int? = nil,
    username: String? = nil
  ) {
    self.init()
    _setScalar(bio, for: \.bio)
    _setScalar(createdAt, for: \.createdAt)
    _setScalar(dateOfBirth, for: \.dateOfBirth)
    _setScalar(displayName, for: \.displayName)
    _setScalar(email, for: \.email)
    _setScalar(firebaseId, for: \.firebaseId)
    _setScalar(firstName, for: \.firstName)
    _setScalar(gender, for: \.gender)
    _setScalar(id, for: \.id)
    _setScalar(lastName, for: \.lastName)
    _setScalar(lastUpdated, for: \.lastUpdated)
    _setEntity(location, for: \.location)
    _setList(myTennisRackets, for: \.myTennisRackets)
    _setList(myTennisStrings, for: \.myTennisStrings)
    _setScalar(profilePicture, for: \.profilePicture)
    _setScalar(rating, for: \.rating)
    _setScalar(username, for: \.username)
  }
}
