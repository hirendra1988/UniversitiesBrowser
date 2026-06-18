// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "NetworkKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "NetworkKit",
            targets: ["NetworkKit"]
        )
    ],
    dependencies: [
        .package(path: "../DomainKit")
    ],
    targets: [
        .target(
            name: "NetworkKit",
            dependencies: [
                "DomainKit"
            ]
        ),
        .testTarget(
            name: "NetworkKitTests",
            dependencies: [
                "NetworkKit"
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
