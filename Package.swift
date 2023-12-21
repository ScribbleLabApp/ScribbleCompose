// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SLCompose",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SLCompose",
            targets: ["SLCompose"]),
        .library(
            name: "SLCompose_Cpp",
            targets: ["SLCompose_Cpp"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SLCompose",
            path: "Sources/SLCompose"
        ),
        .target(
            name: "SLCompose_Cpp",
            dependencies: ["SLCompose"],
            path: "Sources/SLCompose_Cpp",
            publicHeadersPath: "Include/SLCompose_Cpp"
        ),
        .testTarget(
            name: "SLComposeTests",
            dependencies: ["SLCompose"]),
    ]
)
