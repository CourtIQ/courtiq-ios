//
//  CourtIQLocationManaging.swift
//  LocationService
//
//  Created by Pranav Suri on 2024-12-24.
//

import CoreLocation
import Models

@available(iOS 15.0, *)
@MainActor
public protocol CourtIQLocationManaging {
    
    /// Requests When In Use location authorization if not already granted.
    func requestWhenInUseAuthorization() async throws
    
    /// Indicates whether the app is currently authorized to access location.
    var isAuthorized: Bool { get }
    
    /// Fetches the user’s current coordinate (latitude, longitude).
    /// - Throws: An error if location cannot be obtained or authorization is denied.
    func fetchCurrentCoordinate() async throws -> (latitude: Double, longitude: Double)
    
    func getLocationDetails(latitude: Double, longitude: Double) async throws -> Location
}
