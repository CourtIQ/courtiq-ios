//
//  TennisRacket.swift
//  EquipmentService
//
//  Created by Pranav Suri on 2024-12-16.
//

import Foundation

// MARK: - TennisStringEntry

/// A model representing a single entry of tennis strings used with a racket.
/// This encompasses both the racket and string information, as well as timing details
/// such as stringing and burst dates.
public struct TennisString: Equipment, Equatable {
    
    // MARK: - Properties
    
    /// A unique identifier for this string entry.
    public let id: String
    
    /// The unique identifier of the owner of this string entry.
    public let ownerId: String
    
    /// The name or identifier of this string entry, typically referencing the string model or setup.
    public let name: String
    
    /// The type of equipment this represents (e.g., string, racket, etc.).
    public let type: EquipmentType
    
    /// The timestamp indicating when this string entry was created.
    public let createdAt: Date
    
    /// The timestamp indicating when this string entry was last updated.
    public let updatedAt: Date
    
    /// The unique identifier of the racket this string entry is associated with, if any.
    public let racket: String?
    
    /// The brand of the string, if available.
    public let brand: String?
    
    /// The specific brand id of the string, if available.
    public let brandId: Int?
    
    /// The specific model of the string, if available.
    public let model: String?
    
    /// The specific model id of the string, if available.
    public let modelId: Int?
    
    /// The tension details for the mains and crosses of the strings, if available.
    public let tension: StringTension?
    
    /// The date on which the strings were strung into the racket, if available.
    public let stringingDate: Date?
    
    /// The date on which the strings burst or wore out, if available.
    public let burstDate: Date?

    // MARK: - Initialization
    
    /// Initializes a new `TennisStringEntry` instance.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the string entry.
    ///   - ownerId: The unique identifier of the owner of this entry.
    ///   - name: The name or descriptive identifier of this string setup.
    ///   - type: The type of equipment this represents.
    ///   - createdAt: The creation date of this entry.
    ///   - updatedAt: The date this entry was last updated.
    ///   - racket: The unique identifier of the associated racket, if any.
    ///   - brand: The brand of the string, if available.
    ///   - model: The model of the string, if available.
    ///   - tension: The tension details (mains/crosses), if available.
    ///   - stringingDate: The date the racket was strung, if available.
    ///   - burstDate: The date the string burst or wore out, if available.
    public init(
        id: String,
        ownerId: String,
        name: String,
        type: EquipmentType,
        createdAt: Date,
        updatedAt: Date,
        racket: String?,
        brand: String?,
        brandId: Int?,
        model: String?,
        modelId: Int?,
        tension: StringTension?,
        stringingDate: Date?,
        burstDate: Date?
    ) {
        self.id = id
        self.ownerId = ownerId
        self.name = name
        self.type = type
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.racket = racket
        self.brand = brand
        self.brandId = brandId
        self.model = model
        self.modelId = modelId
        self.tension = tension
        self.stringingDate = stringingDate
        self.burstDate = burstDate
    }
}

// MARK: - StringTension

/// A structure representing the tension at which the mains and crosses of the racket were strung.
public struct StringTension: Equatable, Sendable {
    
    // MARK: - Properties
    
    /// The tension (in lbs or kg) of the mains, if available.
    public let mains: Int?
    
    /// The tension (in lbs or kg) of the crosses, if available.
    public let crosses: Int?

    // MARK: - Initialization
    
    /// Initializes a new `StringTension` instance.
    ///
    /// - Parameters:
    ///   - mains: The tension for the mains, if available.
    ///   - crosses: The tension for the crosses, if available.
    public init(mains: Int?, crosses: Int?) {
        self.mains = mains
        self.crosses = crosses
    }
}
