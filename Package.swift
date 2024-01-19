// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-rathena",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "rAthenaCommon",
            targets: ["rAthenaCommon"]
        ),
        .library(
            name: "rAthenaResource",
            targets: ["rAthenaResource"]
        ),
        .library(
            name: "rAthenaDatabase",
            targets: ["rAthenaDatabase"]
        ),
        .library(
            name: "rAthenaNetwork",
            targets: ["rAthenaNetwork"]
        ),
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
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.6"),
    ],
    targets: [
        .target(
            name: "rAthenaCommon",
            path: ".",
            exclude: [
                "3rdparty",
                "doc",
                "src",
                "tools",
                "App",
            ],
            sources: [
                "Sources/rAthenaCommon",
            ],
            resources: [
                .copy("ragnarok.sqlite3"),
                .copy("conf"),
                .copy("db"),
                .copy("npc"),
                .copy("sql-files"),
            ],
            publicHeadersPath: "Sources/rAthenaCommon",
            cxxSettings: [
                .headerSearchPath("3rdparty"),
                .headerSearchPath("3rdparty/rapidyaml/ext/c4core/src"),
                .headerSearchPath("3rdparty/rapidyaml/src"),
                .headerSearchPath("src"),
            ]
        ),
        .target(
            name: "rAthenaResource",
            path: ".",
            exclude: [
                "3rdparty",
                "doc",
                "src",
                "tools",
                "App",
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
            ]
        ),
        .target(
            name: "rAthenaDatabase",
            dependencies: [
                "Yams",
                "rAthenaCommon",
                "rAthenaResource",
            ]
        ),
        .target(
            name: "rAthenaNetwork",
            dependencies: [
                "rAthenaCommon",
            ]
        ),
        .target(
            name: "rAthenaLogin",
            dependencies: [
                "libconfig",
                "ryml",
                "rAthenaCommon",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
                "3rdparty",
            ],
            publicHeadersPath: "",
            cxxSettings: [
                .headerSearchPath("3rdparty/rapidyaml/ext/c4core/src"),
                .headerSearchPath("3rdparty/rapidyaml/src"),
                .unsafeFlags(["-fmodules", "-fcxx-modules"]),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
            ]
        ),
        .target(
            name: "rAthenaChar",
            dependencies: [
                "libconfig",
                "ryml",
                "rAthenaCommon",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
                "3rdparty",
            ],
            publicHeadersPath: "",
            cxxSettings: [
                .headerSearchPath("3rdparty/rapidyaml/ext/c4core/src"),
                .headerSearchPath("3rdparty/rapidyaml/src"),
                .unsafeFlags(["-fmodules", "-fcxx-modules"]),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
            ]
        ),
        .target(
            name: "rAthenaMap",
            dependencies: [
                "libconfig",
                "ryml",
                "rAthenaCommon",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
                "3rdparty",
            ],
            publicHeadersPath: "",
            cxxSettings: [
                .headerSearchPath("3rdparty/rapidyaml/ext/c4core/src"),
                .headerSearchPath("3rdparty/rapidyaml/src"),
                .unsafeFlags(["-fmodules", "-fcxx-modules"]),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
            ]
        ),
        .target(
            name: "rAthenaWeb",
            dependencies: [
                "httplib",
                "libconfig",
                "ryml",
                "yaml-cpp",
                "rAthenaCommon",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
                "3rdparty",
            ],
            publicHeadersPath: "",
            cxxSettings: [
                .headerSearchPath("3rdparty/httplib"),
                .headerSearchPath("3rdparty/json/include"),
                .headerSearchPath("3rdparty/rapidyaml/ext/c4core/src"),
                .headerSearchPath("3rdparty/rapidyaml/src"),
                .unsafeFlags(["-fmodules", "-fcxx-modules"]),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
            ]
        ),
        .target(
            name: "httplib",
            path: "3rdparty/httplib",
            publicHeadersPath: ""
        ),
        .target(
            name: "libconfig",
            path: "3rdparty/libconfig",
            publicHeadersPath: "",
            cSettings: [
                .define("HAVE_XLOCALE_H"),
            ]
        ),
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
            ]
        ),
        .target(
            name: "yaml-cpp",
            path: "3rdparty/yaml-cpp",
            sources: ["src"],
            publicHeadersPath: "include"
        ),
        .plugin(
            name: "rAthenaExportConstantsPlugin",
            capability: .command(
                intent: .custom(verb: "export-constants", description: ""),
                permissions: [
                    .writeToPackageDirectory(reason: "")
                ]
            )
        ),
        .testTarget(
            name: "rAthenaLoginTests",
            dependencies: [
                "rAthenaResource",
                "rAthenaLogin",
            ]
        ),
        .testTarget(
            name: "rAthenaCharTests",
            dependencies: [
                "rAthenaResource",
                "rAthenaChar",
            ]
        ),
        .testTarget(
            name: "rAthenaMapTests",
            dependencies: [
                "rAthenaResource",
                "rAthenaMap",
            ]
        ),
        .testTarget(
            name: "rAthenaWebTests",
            dependencies: [
                "rAthenaResource",
                "rAthenaWeb",
            ]
        ),
        .testTarget(
            name: "rAthenaDatabaseTests",
            dependencies: [
                "rAthenaDatabase",
            ]
        ),
    ],
    cxxLanguageStandard: .cxx17
)
