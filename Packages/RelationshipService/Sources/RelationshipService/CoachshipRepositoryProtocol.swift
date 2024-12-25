//
//  CoachshipRepositoryProtocol.swift
//  SocialService
//
//  Created by Pranav on 2024-12-22.
//

import Foundation
import Models

// MARK: - CoachshipRepositoryProtocol

/// A protocol defining repository operations related to coaching relationships, known as `Coachship`.
public protocol CoachshipRepositoryProtocol: Sendable {
    
    // MARK: - Student Request Lifecycle
    
    /// Sends a request to become a student of another user.
    ///
    /// - Parameter userId: The unique identifier of the user you want to be a student of.
    /// - Returns: The `Coachship` object representing the newly created or updated coachship.
    func requestToBeStudent(of userId: String) async throws -> Coachship
    
    /// Accepts a received student request by its `coachshipId`.
    ///
    /// - Parameter coachshipId: The unique identifier of the pending coachship request.
    /// - Returns: The `Coachship` object with the updated status (e.g., `active`).
    func acceptStudentRequest(coachshipId: String) async throws -> Coachship
    
    /// Rejects a received student request by its `coachshipId`.
    ///
    /// - Parameter coachshipId: The unique identifier of the pending coachship request.
    /// - Returns: The updated `Coachship` object, reflecting that the request has been rejected.
    func rejectStudentRequest(coachshipId: String) async throws -> Coachship
    
    /// Cancels a sent request to become a student by its `coachshipId`.
    ///
    /// - Parameter coachshipId: The unique identifier of the coachship request that was originally sent.
    /// - Returns: The updated `Coachship` object, reflecting that the request has been canceled.
    func cancelRequestToBeStudent(coachshipId: String) async throws -> Coachship
    
    /// Removes a student from the current user's student list by its `coachshipId`.
    ///
    /// - Parameter coachshipId: The unique identifier of the active coachship to be ended.
    /// - Returns: The updated `Coachship` object, reflecting that the student has been removed.
    func removeStudent(coachshipId: String) async throws -> Coachship
    
    // MARK: - Coach Request Lifecycle
    
    /// Sends a request to become a coach of another user.
    ///
    /// - Parameter userId: The unique identifier of the user you want to coach.
    /// - Returns: The `Coachship` object representing the newly created or updated coachship.
    func requestToBeCoach(of userId: String) async throws -> Coachship
    
    /// Accepts a received coach request by its `coachshipId`.
    ///
    /// - Parameter coachshipId: The unique identifier of the pending coachship request.
    /// - Returns: The `Coachship` object with the updated status (e.g., `active`).
    func acceptCoachRequest(coachshipId: String) async throws -> Coachship
    
    /// Rejects a received coach request by its `coachshipId`.
    ///
    /// - Parameter coachshipId: The unique identifier of the pending coachship request.
    /// - Returns: The updated `Coachship` object, reflecting that the request has been rejected.
    func rejectCoachRequest(coachshipId: String) async throws -> Coachship
    
    /// Cancels a sent coach request by its `coachshipId`.
    ///
    /// - Parameter coachshipId: The unique identifier of the coachship request that was originally sent.
    /// - Returns: The updated `Coachship` object, reflecting that the request has been canceled.
    func cancelCoachRequest(coachshipId: String) async throws -> Coachship
    
    /// Removes a coach from the current user's coach list by its `coachshipId`.
    ///
    /// - Parameter coachshipId: The unique identifier of the active coachship to be ended.
    /// - Returns: The updated `Coachship` object, reflecting that the coach has been removed.
    func removeCoach(coachshipId: String) async throws -> Coachship
    
    // MARK: - Coachship Queries
    
    /// Fetches a specific coachship by its unique identifier.
    ///
    /// - Parameter id: The unique identifier of the coachship.
    /// - Returns: The `Coachship` object if found, otherwise `nil`.
    func coachship(id: String) async throws -> Coachship?
    
    /// Fetches all coaches of the current user, with optional pagination.
    ///
    /// - Parameters:
    ///   - limit: The maximum number of `Coachship` objects to retrieve.
    ///   - offset: The offset from where to start retrieving records.
    /// - Returns: An array of `Coachship` objects, each representing a coach relationship for the current user.
    func myCoaches(limit: Int, offset: Int) async throws -> [Coachship]
    
    /// Fetches all students of the current user, with optional pagination.
    ///
    /// - Parameters:
    ///   - limit: The maximum number of `Coachship` objects to retrieve.
    ///   - offset: The offset from where to start retrieving records.
    /// - Returns: An array of `Coachship` objects, each representing a student relationship for the current user.
    func myStudents(limit: Int, offset: Int) async throws -> [Coachship]
    
    /// Fetches student requests that the current user has received.
    ///
    /// - Returns: An array of `Coachship` objects representing student requests received by the user.
    func myStudentRequests() async throws -> [Coachship]
    
    /// Fetches coach requests that the current user has received.
    ///
    /// - Returns: An array of `Coachship` objects representing coach requests received by the user.
    func myCoachRequests() async throws -> [Coachship]
    
    /// Fetches coach requests that the current user has sent.
    ///
    /// - Returns: An array of `Coachship` objects representing coach requests sent by the user.
    func sentCoachRequests() async throws -> [Coachship]
    
    /// Fetches student requests that the current user has sent.
    ///
    /// - Returns: An array of `Coachship` objects representing student requests sent by the user.
    func sentStudentRequests() async throws -> [Coachship]
    
    /// Checks if the given user (studentId) is a student of the current user.
    ///
    /// - Parameter studentId: The unique identifier of the user to check.
    /// - Returns: The `RelationshipStatus` representing the relationship state (e.g., `active`, `none`, `pending`).
    func isStudent(studentId: String) async throws -> RelationshipStatus
    
    /// Checks if the given user (coachId) is a coach of the current user.
    ///
    /// - Parameter coachId: The unique identifier of the user to check.
    /// - Returns: The `RelationshipStatus` representing the relationship state (e.g., `active`, `none`, `pending`).
    func isCoach(coachId: String) async throws -> RelationshipStatus
}
