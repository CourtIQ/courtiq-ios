// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol API_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == API.SchemaMetadata {}

public protocol API_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == API.SchemaMetadata {}

public protocol API_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == API.SchemaMetadata {}

public protocol API_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == API.SchemaMetadata {}

public extension API {
  typealias ID = String

  typealias SelectionSet = API_SelectionSet

  typealias InlineFragment = API_InlineFragment

  typealias MutableSelectionSet = API_MutableSelectionSet

  typealias MutableInlineFragment = API_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Mutation": return API.Objects.Mutation
      case "User": return API.Objects.User
      case "Location": return API.Objects.Location
      case "TennisString": return API.Objects.TennisString
      case "TennisRacket": return API.Objects.TennisRacket
      case "StringTension": return API.Objects.StringTension
      case "Friendship": return API.Objects.Friendship
      case "Coachship": return API.Objects.Coachship
      case "Query": return API.Objects.Query
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}