// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "CourtIQAPI",
    platforms: [
      .iOS(.v14)
    ],
    products: [
        .library(name: "CourtIQAPI", targets: ["CourtIQAPI"]),
        .library(name: "Models", targets: ["Models"])
    ],
    dependencies: [
        .package(url: "https://github.com/apollographql/apollo-ios.git", from: "1.15.0")
    ],
    targets: [
        .target(
            name: "Models",
            dependencies: [
              .product(name: "ApolloAPI", package: "apollo-ios")
            ],
            path: "Sources/Models"
        ),
        .target(
            name: "CourtIQAPI",
            dependencies: [
              "Models",
              .product(name: "Apollo", package: "apollo-ios")
            ]
        ),
        .testTarget(
            name: "CourtIqAPITests",
            dependencies: ["CourtIQAPI"]
        )
    ]
)
