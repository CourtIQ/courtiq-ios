// swift-tools-version: 5.5
import PackageDescription

let package = Package(
    name: "RelationshipService",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "RelationshipService",
            targets: ["RelationshipService"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
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
