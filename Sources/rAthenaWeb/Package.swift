// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "rAthenaWeb",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "rAthenaWeb",
            type: .dynamic,
            targets: ["rAthenaWeb"]),
    ],
    dependencies: [
        .package(path: "../../3rdparty"),
    ],
    targets: [
        .target(
            name: "rAthenaWeb",
            dependencies: [
                .product(name: "httplib", package: "3rdparty"),
                .product(name: "libconfig", package: "3rdparty"),
                .product(name: "ryml", package: "3rdparty"),
                .product(name: "yaml-cpp", package: "3rdparty"),
            ],
            path: ".",
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
    ],
    cxxLanguageStandard: .cxx11
)
