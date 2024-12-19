// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class TennisRacket: MockObject {
  static let objectType: Object = API.Objects.TennisRacket
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<TennisRacket>>

  struct MockFields {
    @Field<String>("brand") public var brand
    @Field<Int>("brandId") public var brandId
    @Field<API.DateTime>("createdAt") public var createdAt
    @Field<API.ObjectID>("currentStringId") public var currentStringId
    @Field<API.ObjectID>("id") public var id
    @Field<String>("model") public var model
    @Field<Int>("modelId") public var modelId
    @Field<String>("name") public var name
    @Field<API.ObjectID>("ownerId") public var ownerId
    @Field<GraphQLEnum<API.EquipmentType>>("type") public var type
    @Field<API.DateTime>("updatedAt") public var updatedAt
    @Field<Double>("weight") public var weight
  }
}

extension Mock where O == TennisRacket {
  convenience init(
    brand: String? = nil,
    brandId: Int? = nil,
    createdAt: API.DateTime? = nil,
    currentStringId: API.ObjectID? = nil,
    id: API.ObjectID? = nil,
    model: String? = nil,
    modelId: Int? = nil,
    name: String? = nil,
    ownerId: API.ObjectID? = nil,
    type: GraphQLEnum<API.EquipmentType>? = nil,
    updatedAt: API.DateTime? = nil,
    weight: Double? = nil
  ) {
    self.init()
    _setScalar(brand, for: \.brand)
    _setScalar(brandId, for: \.brandId)
    _setScalar(createdAt, for: \.createdAt)
    _setScalar(currentStringId, for: \.currentStringId)
    _setScalar(id, for: \.id)
    _setScalar(model, for: \.model)
    _setScalar(modelId, for: \.modelId)
    _setScalar(name, for: \.name)
    _setScalar(ownerId, for: \.ownerId)
    _setScalar(type, for: \.type)
    _setScalar(updatedAt, for: \.updatedAt)
    _setScalar(weight, for: \.weight)
  }
}
