import SwiftUI
import FirebaseAuth

// MARK: - AuthServiceProtocol
@available(iOS 14.0, *)
@MainActor
public protocol AuthServiceProtocol: ObservableObject {
    var isUserLoggedIn: Bool { get set }
    var additionalInfoRequired: Bool { get set }

    func signUp(email: String, password: String) async throws
    func signIn(email: String, password: String) async throws
    func signInWithGoogle() async throws
    func signOut() async throws
    func deleteAccount() async throws
    func getIDToken() async throws -> String
    func setAdditionalInfoProvided()
}
