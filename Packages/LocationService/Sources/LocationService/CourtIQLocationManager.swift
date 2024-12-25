//
//  CourtIQLocationManaging.swift
//  LocationService
//
//  Created by Pranav Suri on 2024-12-24.
//

import CoreLocation
import Foundation
import Models

@MainActor
@available(iOS 15.0, *)
public final class CourtIQLocationManager: NSObject, CourtIQLocationManaging, CLLocationManagerDelegate, ObservableObject {
    
    // MARK: - Properties
    
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()

    // Continuations for async calls
    private var authContinuation: CheckedContinuation<Void, Error>?
    private var locationContinuation: CheckedContinuation<(latitude: Double, longitude: Double), Error>?

    // MARK: - Init
    
    public override init() {
        super.init()
        locationManager.delegate = self
    }
    
    // MARK: - CourtIQLocationManaging
    
    public var isAuthorized: Bool {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            return true
        default:
            return false
        }
    }
    
    public func requestWhenInUseAuthorization() async throws {
        // If we’re already authorized, do nothing
        guard !isAuthorized else { return }
        
        // Otherwise, request authorization and suspend
        return try await withCheckedThrowingContinuation { continuation in
            self.authContinuation = continuation
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    public func fetchCurrentCoordinate() async throws -> (latitude: Double, longitude: Double) {
        print(#function)
        guard isAuthorized else {
            throw LocationError.notAuthorized
        }
        
        // Request a single location update, then suspend
        return try await withCheckedThrowingContinuation { continuation in
            self.locationContinuation = continuation
            locationManager.requestLocation()  // calls delegate when done
        }
    }
    
    public func getLocationDetails(latitude: Double, longitude: Double) async throws -> Location {
        let geocoder = CLGeocoder() // Create new instance for each request
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        do {
            let placemarks = try await geocoder.reverseGeocodeLocation(location)
            guard let placemark = placemarks.first else {
                throw LocationError.noLocations
            }
            
            return Location(
                city: placemark.locality,
                state: placemark.administrativeArea,
                country: placemark.country,
                latitude: latitude,
                longitude: longitude
            )
        } catch {
            throw LocationError.geocodingFailed(error)
        }
    }
    
    // MARK: - CLLocationManagerDelegate
    
    /// Called when the authorization status changes. Non-isolated because CoreLocation may call it from any thread.
    nonisolated public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Hop back onto main actor to interact with `authContinuation`
        Task { @MainActor [weak self] in
            guard let self = self, let continuation = self.authContinuation else { return }
            
            switch status {
            case .authorizedWhenInUse, .authorizedAlways:
                continuation.resume(returning: ())
            case .denied, .restricted:
                continuation.resume(throwing: LocationError.denied)
            case .notDetermined:
                // Still waiting for user input—do nothing
                break
            @unknown default:
                continuation.resume(throwing: LocationError.unknown)
            }
            
            self.authContinuation = nil
        }
    }
    
    /// Called when location updates come in. Non-isolated for the same reason.
    nonisolated public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        Task { @MainActor [weak self] in
            guard let self = self, let continuation = self.locationContinuation else { return }
            
            if let loc = locations.first {
                continuation.resume(returning: (loc.coordinate.latitude, loc.coordinate.longitude))
            } else {
                continuation.resume(throwing: LocationError.noLocations)
            }
            self.locationContinuation = nil
        }
    }
    
    /// Called when location fails. Non-isolated for the same reason.
    nonisolated public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Task { @MainActor [weak self] in
            guard let self = self else { return }
            self.locationContinuation?.resume(throwing: error)
            self.locationContinuation = nil
        }
    }
    
    // MARK: - Errors
    
    public enum LocationError: Error {
        case notAuthorized
        case denied
        case noLocations
        case unknown
        case geocodingFailed(Error)
    }
}
