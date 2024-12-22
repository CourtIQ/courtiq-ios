// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "CourtIQAPI",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "CourtIQAPI", targets: ["CourtIQAPI"]),
        .library(name: "GraphQLModels", targets: ["GraphQLModels"]),
        .library(name: "Models", targets: ["Models"])
    ],
    dependencies: [
        .package(url: "https://github.com/apollographql/apollo-ios.git", from: "1.15.0"),
        .package(path: "../AuthenticationService")
    ],
    targets: [
        .target(
            name: "GraphQLModels",
            dependencies: [
              .product(name: "ApolloAPI", package: "apollo-ios")
            ],
            path: "Sources/Generated"
        ),
        .target(
            name: "Models",
            dependencies: [
              "GraphQLModels"
            ],
            path: "Sources/Models"
        ),

        .target(
            name: "CourtIQAPI",
            dependencies: [
              "GraphQLModels",
              .product(name: "Apollo", package: "apollo-ios"),
              "AuthenticationService",
            ],
            path: "Sources/CourtIQAPI"
        ),
        .testTarget(
            name: "CourtIqAPITests",
            dependencies: ["CourtIQAPI"]
        )
    ]
)
