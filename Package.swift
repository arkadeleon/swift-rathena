// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "rAthena",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "rAthena",
            type: .dynamic,
            targets: ["rAthena"]),
    ],
    dependencies: [
        .package(path: "Sources/rAthenaLogin"),
        .package(path: "Sources/rAthenaChar"),
        .package(path: "Sources/rAthenaMap"),
        .package(path: "Sources/rAthenaWeb"),
        .package(path: "Sources/rAthenaConfig"),
    ],
    targets: [
        .target(
            name: "rAthena",
            dependencies: [
                "rAthenaLogin",
                "rAthenaChar",
                "rAthenaMap",
                "rAthenaWeb",
                "rAthenaConfig",
            ],
            path: ".",
            exclude: [
                "Carthage",
                "Examples",
                "Sources/rAthenaLogin",
                "Sources/rAthenaChar",
                "Sources/rAthenaMap",
                "Sources/rAthenaWeb",
                "Sources/rAthenaConfig",
                "src",
            ],
            sources: [
                "Sources/rAthena",
            ],
            resources: [
                .copy("ragnarok.sqlite3"),
                .copy("conf"),
                .copy("db"),
                .copy("npc"),
                .copy("sql-files"),
            ]),
    ]
)
