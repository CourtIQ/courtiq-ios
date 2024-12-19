// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import CourtIqAPI

class TennisString: MockObject {
  static let objectType: Object = API.Objects.TennisString
  static let _mockFields = MockFields()
  typealias MockValueCollectionType = Array<Mock<TennisString>>

  struct MockFields {
    @Field<String>("brand") public var brand
    @Field<Int>("brandId") public var brandId
    @Field<API.DateTime>("burstDate") public var burstDate
    @Field<API.DateTime>("createdAt") public var createdAt
    @Field<API.ObjectID>("id") public var id
    @Field<String>("model") public var model
    @Field<Int>("modelId") public var modelId
    @Field<String>("name") public var name
    @Field<API.ObjectID>("ownerId") public var ownerId
    @Field<API.ObjectID>("racket") public var racket
    @Field<API.DateTime>("stringingDate") public var stringingDate
    @Field<StringTension>("tension") public var tension
    @Field<GraphQLEnum<API.EquipmentType>>("type") public var type
    @Field<API.DateTime>("updatedAt") public var updatedAt
  }
}

extension Mock where O == TennisString {
  convenience init(
    brand: String? = nil,
    brandId: Int? = nil,
    burstDate: API.DateTime? = nil,
    createdAt: API.DateTime? = nil,
    id: API.ObjectID? = nil,
    model: String? = nil,
    modelId: Int? = nil,
    name: String? = nil,
    ownerId: API.ObjectID? = nil,
    racket: API.ObjectID? = nil,
    stringingDate: API.DateTime? = nil,
    tension: Mock<StringTension>? = nil,
    type: GraphQLEnum<API.EquipmentType>? = nil,
    updatedAt: API.DateTime? = nil
  ) {
    self.init()
    _setScalar(brand, for: \.brand)
    _setScalar(brandId, for: \.brandId)
    _setScalar(burstDate, for: \.burstDate)
    _setScalar(createdAt, for: \.createdAt)
    _setScalar(id, for: \.id)
    _setScalar(model, for: \.model)
    _setScalar(modelId, for: \.modelId)
    _setScalar(name, for: \.name)
    _setScalar(ownerId, for: \.ownerId)
    _setScalar(racket, for: \.racket)
    _setScalar(stringingDate, for: \.stringingDate)
    _setEntity(tension, for: \.tension)
    _setScalar(type, for: \.type)
    _setScalar(updatedAt, for: \.updatedAt)
  }
}
