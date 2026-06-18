// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "DomainKit",
    products: [
        .library(
            name: "DomainKit",
            targets: ["DomainKit"]
        ),
    ],
    targets: [
        .target(
            name: "DomainKit"
        ),
        .testTarget(
            name: "DomainKitTests",
            dependencies: ["DomainKit"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
