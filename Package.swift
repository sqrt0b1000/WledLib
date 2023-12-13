// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WledLib",
    platforms: [
            .macOS(.v10_15),
            .iOS(.v13),
        ],
    products: [
        .library(
            name: "WledLib",
            targets: ["WledLib"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "WledLib",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
    ]
)
