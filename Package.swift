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
            name: "rAthenaLogin",
            type: .dynamic,
            targets: ["rAthenaLogin"]
        ),
        .library(
            name: "rAthenaChar",
            type: .dynamic,
            targets: ["rAthenaChar"]
        ),
        .library(
            name: "rAthenaMap",
            type: .dynamic,
            targets: ["rAthenaMap"]
        ),
        .library(
            name: "rAthenaWeb",
            type: .dynamic,
            targets: ["rAthenaWeb"]
        ),
        .library(
            name: "rAthenaPacket",
            type: .dynamic,
            targets: ["rAthenaPacket"]
        ),
        .library(
            name: "rAthenaResource",
            type: .dynamic,
            targets: ["rAthenaResource"]
        ),
    ],
    targets: [
        .target(
            name: "rAthenaLogin",
            dependencies: [
                "libconfig",
                "ryml",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
                "rapidyaml",
            ],
            publicHeadersPath: "",
            cxxSettings: [
                .headerSearchPath("rapidyaml/ext/c4core/src"),
                .headerSearchPath("rapidyaml/src"),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
            ]),
        .target(
            name: "rAthenaChar",
            dependencies: [
                "libconfig",
                "ryml",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
                "rapidyaml",
            ],
            publicHeadersPath: "",
            cxxSettings: [
                .headerSearchPath("rapidyaml/ext/c4core/src"),
                .headerSearchPath("rapidyaml/src"),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
            ]),
        .target(
            name: "rAthenaMap",
            dependencies: [
                "libconfig",
                "ryml",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
                "rapidyaml",
            ],
            publicHeadersPath: "",
            cxxSettings: [
                .headerSearchPath("rapidyaml/ext/c4core/src"),
                .headerSearchPath("rapidyaml/src"),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
            ]),
        .target(
            name: "rAthenaWeb",
            dependencies: [
                "httplib",
                "libconfig",
                "ryml",
                "yaml-cpp",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
                "httplib",
                "json",
                "rapidyaml",
            ],
            publicHeadersPath: "",
            cxxSettings: [
                .headerSearchPath("httplib"),
                .headerSearchPath("json/include"),
                .headerSearchPath("rapidyaml/ext/c4core/src"),
                .headerSearchPath("rapidyaml/src"),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
            ]),
        .target(
            name: "rAthenaPacket",
            dependencies: [
                "rAthenaConfig",
            ]),
        .target(
            name: "rAthenaConfig",
            publicHeadersPath: ""),
        .target(
            name: "rAthenaResource",
            path: ".",
            exclude: [
                "3rdparty",
                "doc",
                "Examples",
                "src",
                "tools",
            ],
            sources: [
                "Sources/rAthenaResource",
            ],
            resources: [
                .copy("ragnarok.sqlite3"),
                .copy("conf"),
                .copy("db"),
                .copy("npc"),
                .copy("sql-files"),
            ],
            publicHeadersPath: "Sources/rAthenaResource"),
        .target(
            name: "httplib",
            path: "3rdparty/httplib",
            publicHeadersPath: ""),
        .target(
            name: "libconfig",
            path: "3rdparty/libconfig",
            publicHeadersPath: "",
            cSettings: [
                .define("HAVE_XLOCALE_H"),
            ]),
        .target(
            name: "ryml",
            path: "3rdparty/rapidyaml",
            sources: [
                "ext/c4core/src",
                "src",
            ],
            publicHeadersPath: "src",
            cxxSettings: [
                .headerSearchPath("ext/c4core/src"),
                .headerSearchPath("src"),
            ]),
        .target(
            name: "yaml-cpp",
            path: "3rdparty/yaml-cpp",
            sources: ["src"],
            publicHeadersPath: "include"),
    ],
    cxxLanguageStandard: .cxx11
)
