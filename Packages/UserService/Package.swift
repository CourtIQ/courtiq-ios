// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserService",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "UserService",
            targets: ["UserService"]),
    ],
    dependencies: [
        .package(path: "../CourtIQAPI"),
    ],
    targets: [
        .target(
            name: "UserService",
            dependencies: [
                .product(name: "CourtIQAPI", package: "CourtIQAPI"), // CourtIQAPI
                .product(name: "Models", package: "CourtIQAPI")      // Models from CourtIQAPI
            ]
        ),
        .testTarget(
            name: "UserServiceTests",
            dependencies: ["UserService"]),
    ]
)
