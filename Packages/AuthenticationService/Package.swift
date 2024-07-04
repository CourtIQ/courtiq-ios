// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "AuthenticationService",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "AuthenticationService",
            targets: ["AuthenticationService"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.26.0")
    ],
    targets: [
        .target(
            name: "AuthenticationService",
            dependencies: [
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "AuthenticationServiceTests",
            dependencies: ["AuthenticationService"],
            path: "Tests"
        ),
    ]
)
