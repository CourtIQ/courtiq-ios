// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class Location: MockObject {
  static let objectType: Object = API.Objects.Location
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<Location>>

  struct MockFields {
    @Field<String>("city") public var city
    @Field<String>("country") public var country
    @Field<Double>("latitude") public var latitude
    @Field<Double>("longitude") public var longitude
    @Field<String>("state") public var state
  }
}

extension Mock where O == Location {
  convenience init(
    city: String? = nil,
    country: String? = nil,
    latitude: Double? = nil,
    longitude: Double? = nil,
    state: String? = nil
  ) {
    self.init()
    _setScalar(city, for: \.city)
    _setScalar(country, for: \.country)
    _setScalar(latitude, for: \.latitude)
    _setScalar(longitude, for: \.longitude)
    _setScalar(state, for: \.state)
  }
}
