// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "rAthenaDependencies",
    products: [
        .library(
            name: "httplib",
            targets: ["httplib"]),
        .library(
            name: "libconfig",
            targets: ["libconfig"]),
        .library(
            name: "ryml",
            targets: ["ryml"]),
        .library(
            name: "yaml-cpp",
            targets: ["yaml-cpp"]),
    ],
    targets: [
        .target(
            name: "httplib",
            path: "httplib",
            publicHeadersPath: ""),
        .target(
            name: "libconfig",
            path: "libconfig",
            publicHeadersPath: "",
            cSettings: [
                .define("HAVE_XLOCALE_H"),
            ]),
        .target(
            name: "ryml",
            path: "rapidyaml",
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
            path: "yaml-cpp",
            sources: ["src"],
            publicHeadersPath: "include"),
    ],
    cxxLanguageStandard: .cxx11
)
