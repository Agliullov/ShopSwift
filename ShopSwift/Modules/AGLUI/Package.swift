// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AGLUI",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "AGLUI",
            targets: ["AGLUI"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "AGLUI",
            dependencies: []),
        .testTarget(
            name: "AGLUITests",
            dependencies: ["AGLUI"]),
    ]
)
