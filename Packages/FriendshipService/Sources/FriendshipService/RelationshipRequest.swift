import Foundation

// MARK: - RelationshipRequest Struct

/// Represents a relationship request between two users.
///
/// The request includes information about the sender, receiver, type of request, and creation timestamp.
public struct RelationshipRequest: Codable, Identifiable {
    
    // MARK: - Properties
    
    /// Unique identifier for the request document.
    public var id: String
    
    /// The ID of the user who sent the request.
    public var senderID: String
    
    /// The ID of the user who received the request.
    public var receiverID: String
    
    /// The type of the relationship request (e.g., friend, coach).
    public var requestType: RelationshipType
    
    /// The name of the user who sent the request.
    public var senderName: String?
    
    /// The profile picture URL of the user who sent the request.
    public var senderProfilePicture: URL?
    
    /// The name of the user who received the request.
    public var receiverName: String?
    
    /// The profile picture URL of the user who received the request.
    public var receiverProfilePicture: URL?
    
    /// Timestamp of when the request was created.
    public var createdAt: Date
    
    // MARK: - Initializer
    
    /// Initializes a new relationship request between two users.
    /// - Parameters:
    ///   - senderID: The ID of the user who sent the request.
    ///   - receiverID: The ID of the user who received the request.
    ///   - requestType: The type of the relationship request (e.g., friend, coach).
    ///   - senderName: The name of the user who sent the request (optional).
    ///   - senderProfilePicture: The profile picture URL of the user who sent the request (optional).
    ///   - receiverName: The name of the user who received the request (optional).
    ///   - receiverProfilePicture: The profile picture URL of the user who received the request (optional).
    ///   - createdAt: The timestamp of when the request was created (defaults to the current date and time).
    public init(senderID: String, receiverID: String, requestType: RelationshipType, senderName: String? = nil, senderProfilePicture: URL? = nil, receiverName: String? = nil, receiverProfilePicture: URL? = nil, createdAt: Date = Date()) {
        self.id = UUID().uuidString // Generate a unique ID
        self.senderID = senderID
        self.receiverID = receiverID
        self.requestType = requestType
        self.senderName = senderName
        self.senderProfilePicture = senderProfilePicture
        self.receiverName = receiverName
        self.receiverProfilePicture = receiverProfilePicture
        self.createdAt = createdAt
    }
}
