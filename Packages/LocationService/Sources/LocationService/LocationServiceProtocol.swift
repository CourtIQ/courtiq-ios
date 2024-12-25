//
//  LocationServiceProtocol.swift
//  LocationService
//
//  Created by Pranav Suri on 2024-12-25.
//

import CoreLocation
import Foundation

@available(iOS 15.0, *)
@MainActor
public protocol LocationServiceProtocol {
    
    // MARK: - Location Auth & Current Coordinate
    
    /// Requests "When In Use" authorization for location services.
    func requestWhenInUseAuthorization() async throws
    
    /// Indicates whether the app is currently authorized to access location.
    var isAuthorized: Bool { get }
    
    /// Fetches the user's current coordinate (lat, lng).
    func fetchCurrentCoordinate() async throws -> (latitude: Double, longitude: Double)
    
    
    // MARK: - City Autocomplete
    
    /// Autocomplete city names (optionally region/state).
    /// This simply delegates to your Google Places autocompleteCities function.
    func fetchAutocompleteCities(query: String) async throws -> [AutocompleteResult]
    
    
    // MARK: - Tennis Courts Nearby
    
    /// Finds nearby tennis courts using the user’s current location as a bias.
    /// This can delegate internally to Google Places "searchNearby" with keyword = "tennis courts".
    func fetchAutocompleteTennisCourts() async throws -> [PlaceResult]
}
