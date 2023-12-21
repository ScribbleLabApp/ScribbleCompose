// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SLAI",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SLAI",
            targets: ["SLAI"]),
        .library(
            name: "SLAI_Cpp",
            targets: ["SLAI_Cpp"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SLAI",
            path: "Sources/SLAI"
        ),
        .target(
            name: "SLAI_Cpp",
            dependencies: ["SLAI"],
            path: "Sources/SLAI_Cpp",
            publicHeadersPath: "Sources/SLAI_Cpp/Include"
        ),
        .testTarget(
            name: "SLAI_Tests",
            dependencies: ["SLAI"]),
    ]
)
