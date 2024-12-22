// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension API {
  /// Represents the possible status of a relationship between users.
  enum RelationshipStatus: String, EnumType {
    /// The relationship is in a pending state, meaning a request has been sent but not yet accepted.
    case pending = "PENDING"
    /// The relationship is active, meaning the request has been accepted and the relationship is established.
    case active = "ACTIVE"
    case none = "NONE"
  }

}