// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataService",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "DataService",
            targets: ["DataService"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.26.0"),
    ],
    targets: [
        .target(
            name: "DataService",
            dependencies: [
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
            ]),
        .testTarget(
            name: "DataServiceTests",
            dependencies: ["DataService"]),
    ]
)
