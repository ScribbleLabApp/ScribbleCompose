// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SLCompose",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .watchOS(.v10),
        .visionOS(.v1),
        .tvOS(.v17),
        .macCatalyst(.v17)
    ],
    products: [
        .library(
            name: "SLCompose",
            targets: ["SLCompose"]),
        .library(name: "SLComposeUI", targets: ["SLComposeUI"]),
        .library(name: "SLComposeService", targets: ["SLComposeService"])
    ],
    targets: [
        .target(
            name: "SLCompose",
            path: "Sources/SLCompose"
        ),
        .target(
            name: "SLComposeUI",
            path: "Sources/SLComposeUI"
        ),
        .target(
            name: "SLComposeService",
            path: "Sources/SLComposeService"
        ),
        .testTarget(
            name: "SLComposeTests",
            dependencies: ["SLCompose"]
        )
    ]
)
