// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "CommonUI",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "CommonUI",
            targets: ["CommonUI"]
        )
    ],
    targets: [
        .target(
            name: "CommonUI"
        ),
        .testTarget(
            name: "CommonUITests",
            dependencies: ["CommonUI"]
        )
    ]
)
