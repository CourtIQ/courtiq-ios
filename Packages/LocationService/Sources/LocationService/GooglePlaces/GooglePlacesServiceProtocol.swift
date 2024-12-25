//
//  GooglePlacesServiceProtocol.swift
//  LocationService
//
//  Created by Pranav Suri on 2024-12-24.
//

import Foundation

/// A protocol defining several Google Places REST operations.
import Foundation

@available(iOS 15.0, macOS 12.0, *)
public protocol GooglePlacesServiceProtocol {
    
    // MARK: - 1) City Autocomplete
    /// Autocomplete city names (and optionally region/state).
    /// - Parameters:
    ///   - query: The partial text the user typed (e.g. "New Y" -> "New York")
    ///   - coordinate: (Optional) A lat/lng to bias results geographically
    ///   - radius: (Optional) Radius in meters for geographic bias
    /// - Returns: An array of `AutocompleteResult`
    func autocompleteCities(
        query: String,
        coordinate: (lat: Double, lng: Double)?,
        radius: Int?
    ) async throws -> [AutocompleteResult]
    
    
    // MARK: - 2) General Place Autocomplete
    /// Autocomplete for general addresses or business names.
    /// - Parameters:
    ///   - query: The partial text (e.g., "1600 Amphith")
    ///   - coordinate: (Optional) A lat/lng to bias results
    ///   - radius: (Optional) in meters
    ///   - types: (Optional) filter results by place types (e.g. "address", "establishment")
    /// - Returns: An array of `AutocompleteResult`
    func autocompletePlaces(
        query: String,
        coordinate: (lat: Double, lng: Double)?,
        radius: Int?,
        types: [String]?
    ) async throws -> [AutocompleteResult]
    
    
    // MARK: - 3) Nearby Search
    /// Searches for places near a given coordinate using a keyword or type filter.
    /// For example, find "tennis courts" near user’s location.
    /// - Parameters:
    ///   - coordinate: The lat/lng around which to search
    ///   - radius: The search radius in meters
    ///   - keyword: (Optional) e.g. "tennis courts"
    ///   - type: (Optional) e.g. "park", "stadium", "gym"
    /// - Returns: An array of `PlaceResult`
    func searchNearby(
        coordinate: (lat: Double, lng: Double),
        radius: Int,
        keyword: String?,
        type: String?
    ) async throws -> [PlaceResult]
    
    
    // MARK: - 4) Place Details
    /// Fetch detailed info about a place using its place_id.
    /// - Parameters:
    ///   - placeId: The Google place_id
    ///   - fields: Which fields to request (e.g. ["name", "formatted_address", "geometry", "website", "rating"])
    /// - Returns: A `PlaceDetailsResult` containing the requested place details
    func fetchPlaceDetails(
        placeId: String,
        fields: [String]
    ) async throws -> PlaceDetailsResult
}

/// Standard result for an Autocomplete entry.
public struct AutocompleteResult: Identifiable, Decodable {
    public let id: String
    public let primaryText: String
    public let secondaryText: String
    
    public init(
        id: String,
        primaryText: String,
        secondaryText: String
    ) {
        self.id = id
        self.primaryText = primaryText
        self.secondaryText = secondaryText
    }
}

/// Standard result for a place from a Nearby Search or similar.
public struct PlaceResult: Identifiable {
    public let id: String            // place_id
    public let name: String
    public let address: String?
    public let coordinate: (lat: Double, lng: Double)
    
    public init(
        id: String,
        name: String,
        address: String?,
        coordinate: (Double, Double)
    ) {
        self.id = id
        self.name = name
        self.address = address
        self.coordinate = coordinate
    }
}

/// Detailed info from the Place Details endpoint
public struct PlaceDetailsResult: Identifiable {
    public let id: String            // place_id
    public let name: String?
    public let formattedAddress: String?
    public let coordinate: (lat: Double, lng: Double)?
    public let phoneNumber: String?
    public let website: String?
    public let rating: Double?
    
    public init(
        id: String,
        name: String?,
        formattedAddress: String?,
        coordinate: (Double, Double)?,
        phoneNumber: String?,
        website: String?,
        rating: Double?
    ) {
        self.id = id
        self.name = name
        self.formattedAddress = formattedAddress
        self.coordinate = coordinate
        self.phoneNumber = phoneNumber
        self.website = website
        self.rating = rating
    }
}

