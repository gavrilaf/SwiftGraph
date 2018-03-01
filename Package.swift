// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SwiftGraph",
    
    products: [
        .library(name: "SwiftGraph", targets: ["SwiftGraph"]),
    ],
    targets: [
        .target(
            name: "SwiftGraph",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "SwiftGraphTests",
            dependencies: ["SwiftGraph"]),
    ]
)
