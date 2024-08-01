// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "RDDesignSystem",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RDDesignSystem",
            targets: ["RDDesignSystem"]),
    ],
    dependencies: [
      .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RDDesignSystem",
            dependencies: [],
            path: "Sources", 
            resources: [
                .process("Resources")
            ] 
//            plugins: [
//                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
//            ]
        ),
        
        .testTarget(
            name: "RDDesignSystemTests",
            dependencies: ["RDDesignSystem"]),
    ]
)
