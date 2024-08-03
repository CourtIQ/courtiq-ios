// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "RDDesignSystem",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "RDDesignSystem",
            targets: ["RDDesignSystem"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RDDesignSystem",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "RDDesignSystemTests",
            dependencies: ["RDDesignSystem"],
            path: "Tests"
        ),
    ]
)
