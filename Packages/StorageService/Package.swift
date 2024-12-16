// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "StorageService",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "StorageService",
            targets: ["StorageService"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "11.0.0")
    ],
    targets: [
        .target(
            name: "StorageService",
            dependencies: [
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "StorageServiceTests",
            dependencies: ["StorageService"],
            path: "Tests"
        ),
    ]
)
