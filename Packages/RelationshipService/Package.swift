// swift-tools-version: 5.5
import PackageDescription

let package = Package(
    name: "RelationshipService",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "RelationshipService",
            targets: ["RelationshipService"]),
    ],
    dependencies: [
        .package(path: "../DataService")
    ],
    targets: [
        .target(
            name: "RelationshipService",
            dependencies: ["DataService"]),
        .testTarget(
            name: "RelationshipServiceTests",
            dependencies: ["RelationshipService"]),
    ]
)
