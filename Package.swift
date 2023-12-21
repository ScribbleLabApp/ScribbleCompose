// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScribbleLab AI",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ScribbleLab AI",
            targets: ["ScribbleLab AI"]),
        .library(
            name: "ScribbleLab AI Cpp",
            targets: ["ScribbleLab AI Cpp"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ScribbleLab AI"),
        .target(
            name: "ScribbleLab_AI_Cpp",
            dependencies: ["ScribbleLab_AI"],
            path: "Sources/ScribbleLab_AI_Cpp"
        ),
        .testTarget(
            name: "ScribbleLab AITests",
            dependencies: ["ScribbleLab AI"]),
    ]
)
