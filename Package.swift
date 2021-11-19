// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Auto Layout",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13)
    ],
    products: [
        .library(name: "AutoLayout", targets: ["AutoLayout"])
    ],
    dependencies: [],
    targets: [
        .target(name: "AutoLayout")
    ]
)
