// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "PersistenceKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "PersistenceKit",
            targets: ["PersistenceKit"]
        )
    ],
    dependencies: [
        .package(path: "../DomainKit")
    ],
    targets: [
        .target(
            name: "PersistenceKit",
            dependencies: [
                "DomainKit"
            ],
            resources: [
                .process("CoreData")
            ]
        ),
        .testTarget(
            name: "PersistenceKitTests",
            dependencies: ["PersistenceKit"]
        )
    ]
)
