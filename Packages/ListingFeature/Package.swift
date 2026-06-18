// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ListingFeature",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ListingFeature",
            targets: ["ListingFeature"]
        )
    ],
    dependencies: [
        .package(path: "../DomainKit"),
        .package(path: "../NetworkKit"),
        .package(path: "../PersistenceKit"),
        .package(path: "../CommonUI"),
        .package(path: "../DetailsFeature")
    ],
    targets: [
        .target(
            name: "ListingFeature",
            dependencies: [
                "DomainKit",
                "NetworkKit",
                "PersistenceKit",
                "CommonUI",
                "DetailsFeature"
            ]
        ),
        .testTarget(
            name: "ListingFeatureTests",
            dependencies: [
                "ListingFeature",
                "DomainKit"
            ]
        )
    ]
)
