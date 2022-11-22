// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "rAthenaConfig",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "rAthenaConfig",
            targets: ["rAthenaConfig"]),
    ],
    targets: [
        .target(
            name: "rAthenaConfig",
            path: ".",
            publicHeadersPath: ""),
    ]
)
