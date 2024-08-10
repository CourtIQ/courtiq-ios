import Foundation

// MARK: - Relationship Struct

/// Represents a relationship between two users.
///
/// The relationship includes information about the related user's ID, the type of relationship, and timestamps for creation and updates.
@available(iOS 14.0, *)
public struct Relation: Codable, Identifiable {
    
    // MARK: - Properties
    
    /// Unique identifier for the relationship document.
    public var id: String
    
    /// The ID of the related user in the relationship.
    public var relatedID: String
    
    /// The type of the relationship (e.g., friend, coach).
    public var relationType: RelationType
    
    /// The name of the related user.
    public var relatedName: String?
    
    /// The profile picture URL of the related user.
    public var imageUrls: URL?
    
    /// Timestamp of when the relationship was created.
    public var createdAt: Date
    
    /// Timestamp of the last update to the relationship.
    public var updatedAt: Date
    
    // MARK: - Initializer
    
    /// Initializes a new relationship between two users.
    /// - Parameters:
    ///   - id: The unique identifier for the relationship document.
    ///   - relatedUserID: The ID of the other user in the relationship.
    ///   - relationshipType: The type of the relationship (e.g., friend, coach).
    ///   - relatedUserName: The name of the related user (optional).
    ///   - relatedUserProfilePicture: The profile picture URL of the related user (optional).
    ///   - createdAt: The timestamp of when the relationship was created (defaults to the current date and time).
    ///   - updatedAt: The timestamp of the last update to the relationship (defaults to the current date and time).
    public init(relatedUserID: String, relationshipType: RelationType, relatedUserName: String? = nil, relatedUserProfilePicture: URL? = nil, createdAt: Date = Date(), updatedAt: Date = Date()) {
        self.id = UUID().uuidString
        self.relatedID = relatedUserID
        self.relationType = relationshipType
        self.relatedName = relatedUserName
        self.imageUrls = relatedUserProfilePicture
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
