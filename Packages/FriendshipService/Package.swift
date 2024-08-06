// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "FriendshipService",
    platforms: [
        .macOS(.v10_15), .iOS(.v13)
    ],
    products: [
        .library(
            name: "FriendshipService",
            targets: ["FriendshipService"]),
    ],
    dependencies: [
        .package(path: "../DataService")
    ],
    targets: [
        .target(
            name: "FriendshipService",
            dependencies: ["DataService"]),
        .testTarget(
            name: "FriendshipServiceTests",
            dependencies: ["FriendshipService"]),
    ]
)
