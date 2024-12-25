//
//  GooglePlacesServiceProtocol.swift
//  LocationService
//
//  Created by Pranav Suri on 2024-12-24.
//

import Foundation

@available(iOS 15.0, macOS 12.0, *)
public final class GooglePlacesService: GooglePlacesServiceProtocol {
    
    private let apiKey: String
    
    /// Pass your Google API key here. If you'd like to hardcode, you can do:
    ///   self.apiKey = "YOUR_HARDCODED_API_KEY"
    public init(apiKey: String? = "AIzaSyB3_aZvg6AFbo4I04XIavl4z_E_XfwVMQA") {
        self.apiKey = "AIzaSyB3_aZvg6AFbo4I04XIavl4z_E_XfwVMQA"
    }
    
    // MARK: - 1) City Autocomplete (Implemented)
    ///
    /// Autocomplete city names (and optionally region/state).
    /// - Parameters:
    ///   - query: The partial text the user typed (e.g. "New Y" -> "New York")
    ///   - coordinate: A lat/lng to bias results (optional)
    ///   - radius: Radius in meters for bias (optional)
    /// - Returns: An array of `AutocompleteResult`
    public func autocompleteCities(
        query: String,
        coordinate: (lat: Double, lng: Double)?,
        radius: Int?
    ) async throws -> [AutocompleteResult] {
        
        guard var components = URLComponents(string: "https://maps.googleapis.com/maps/api/place/autocomplete/json") else {
            throw GooglePlacesError.invalidURL
        }
        
        // Common query items
        var queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "input", value: query),
            // This is somewhat undocumented, but can help focus on city-level suggestions
            URLQueryItem(name: "types", value: "(cities)")
        ]
        
        // Optional location/radius bias
        if let coordinate = coordinate {
            queryItems.append(URLQueryItem(name: "location", value: "\(coordinate.lat),\(coordinate.lng)"))
            if let radius = radius {
                queryItems.append(URLQueryItem(name: "radius", value: "\(radius)"))
            }
        }
        
        components.queryItems = queryItems
        
        guard let url = components.url else {
            throw GooglePlacesError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(AutocompleteAPIResponse.self, from: data)
        
        // Check response.status if desired (e.g. "OK", "ZERO_RESULTS", etc.)
        
        let results = response.predictions.map { prediction in
            AutocompleteResult(
                id: prediction.place_id,
                primaryText: prediction.structured_formatting.main_text,
                secondaryText: prediction.structured_formatting.secondary_text ?? ""
            )
        }
        
        return results
    }
    
    // MARK: - 2) General Place Autocomplete (Stub)
    public func autocompletePlaces(
        query: String,
        coordinate: (lat: Double, lng: Double)?,
        radius: Int?,
        types: [String]?
    ) async throws -> [AutocompleteResult] {
        // TODO: Implement real logic using the Autocomplete endpoint
        // with optional `types`, possibly "address|establishment", etc.
        throw GooglePlacesError.notImplemented
    }
    
    // MARK: - 3) Nearby Search (Stub)
    public func searchNearby(
        coordinate: (lat: Double, lng: Double),
        radius: Int,
        keyword: String?,
        type: String?
    ) async throws -> [PlaceResult] {
        // TODO: Implement using the "nearbysearch" endpoint
        // e.g. https://maps.googleapis.com/maps/api/place/nearbysearch/json
        throw GooglePlacesError.notImplemented
    }
    
    // MARK: - 4) Place Details (Stub)
    public func fetchPlaceDetails(
        placeId: String,
        fields: [String]
    ) async throws -> PlaceDetailsResult {
        // TODO: Implement using the "details" endpoint
        // e.g. https://maps.googleapis.com/maps/api/place/details/json
        throw GooglePlacesError.notImplemented
    }
    
    // MARK: - Internal Models & Errors
    
    /// Possible errors for this service
    public enum GooglePlacesError: Error {
        case invalidURL
        case notImplemented
        // You can add more: .noData, .apiError, etc.
    }
}

/// The top-level JSON response from the Places Autocomplete endpoint
private struct AutocompleteAPIResponse: Decodable {
    let predictions: [AutocompletePrediction]
    let status: String?
}

/// Each prediction item from the API
private struct AutocompletePrediction: Decodable {
    let place_id: String
    let description: String
    let structured_formatting: StructuredFormatting
}

/// Nested formatting details (often includes main text & secondary text)
private struct StructuredFormatting: Decodable {
    let main_text: String
    let secondary_text: String?
}
