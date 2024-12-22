//
//  EnvironmentKey.swift
//  UserService
//
//  Created by Pranav Suri on 2024-12-21.
//

import SwiftUI

// MARK: - UserServiceKey

public struct UserServiceKey: EnvironmentKey {
    public static let defaultValue: UserServiceProtocol? = nil
}

public extension EnvironmentValues {
    var userService: UserServiceProtocol? {
        get { self[UserServiceKey.self] }
        set { self[UserServiceKey.self] = newValue }
    }
}
