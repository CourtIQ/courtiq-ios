// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserService",
    products: [
        .library(
            name: "UserService",
            targets: ["UserService"]),
    ],
    dependencies: [
        .package(path: "../DataService"),
        .package(path: "../AuthenticationService"),
    ],
    targets: [
        .target(
            name: "UserService",
            dependencies: ["DataService", "AuthenticationService"]),
        .testTarget(
            name: "UserServiceTests",
            dependencies: ["UserService"]),
    ]
)
