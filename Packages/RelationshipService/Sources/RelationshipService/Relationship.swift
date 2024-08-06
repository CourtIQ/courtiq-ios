import Foundation

// MARK: - Relationship Struct

/// Represents a relationship between two users.
///
/// The relationship includes information about the related user's ID, the type of relationship, and timestamps for creation and updates.
public struct Relationship: Codable, Identifiable {
    
    // MARK: - Properties
    
    /// Unique identifier for the relationship document.
    public var id: String
    
    /// The ID of the related user in the relationship.
    public var relatedUserID: String
    
    /// The type of the relationship (e.g., friend, coach).
    public var relationshipType: RelationshipType
    
    /// The name of the related user.
    public var relatedUserName: String?
    
    /// The profile picture URL of the related user.
    public var relatedUserProfilePicture: URL?
    
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
    public init(relatedUserID: String, relationshipType: RelationshipType, relatedUserName: String? = nil, relatedUserProfilePicture: URL? = nil, createdAt: Date = Date(), updatedAt: Date = Date()) {
        self.id = UUID().uuidString
        self.relatedUserID = relatedUserID
        self.relationshipType = relationshipType
        self.relatedUserName = relatedUserName
        self.relatedUserProfilePicture = relatedUserProfilePicture
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
