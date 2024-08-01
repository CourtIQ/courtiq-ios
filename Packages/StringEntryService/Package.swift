// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let package = Package(
    name: "StringEntryService",
    products: [
        .library(
            name: "StringEntryService",
            targets: ["StringEntryService"]),
    ],
    dependencies: [
        .package(path: "../DataService"),
    ],
    targets: [
        .target(
            name: "StringEntryService",
            dependencies: ["DataService"]),
        .testTarget(
            name: "StringEntryServiceTests",
            dependencies: ["DataService"]),
    ]
)
