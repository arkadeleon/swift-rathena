// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

// Match src/map/CMakeLists.txt: job factories include individual skill .cpp files.
// Compile the factories and shared implementation, excluding the included sources.
let skillsDirectory = URL(fileURLWithPath: #filePath)
    .deletingLastPathComponent()
    .appendingPathComponent("Sources/rAthenaMap/map/skills")
let excludedSkillSources = try FileManager.default
    .subpathsOfDirectory(atPath: skillsDirectory.path)
    .filter { path in
        let filename = URL(fileURLWithPath: path).lastPathComponent
        return path.hasSuffix(".cpp")
            && path != "skill_factory.cpp"
            && path != "skill_impl.cpp"
            && !filename.hasPrefix("skill_factory_")
    }
    .map { "map/skills/\($0)" }
    .sorted()

let package = Package(
    name: "swift-rathena",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "rAthenaCommon",
            targets: ["rAthenaCommon"]
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
        .library(
            name: "rAthenaResources",
            targets: ["rAthenaResources"]
        ),
    ],
    targets: [
        .target(
            name: "rAthenaCommon",
            dependencies: [
                "libconfig",
                "ryml",
            ],
            exclude: [
                "common",
                "config",
                "custom",
                "map",
            ],
            cxxSettings: [
                .headerSearchPath(""),
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
            ],
            cxxSettings: [
                .headerSearchPath(""),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
                .unsafeFlags(["-fprofile-instr-generate"]),
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
            ],
            cxxSettings: [
                .headerSearchPath(""),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
                .unsafeFlags(["-fprofile-instr-generate"]),
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
            ] + excludedSkillSources,
            cxxSettings: [
                .headerSearchPath(""),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
                .unsafeFlags(["-fprofile-instr-generate"]),
            ]
        ),
        .target(
            name: "rAthenaWeb",
            dependencies: [
                "httplib",
                "json",
                "libconfig",
                "ryml",
                "yaml-cpp",
                "rAthenaCommon",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
            ],
            cxxSettings: [
                .headerSearchPath(""),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
                .unsafeFlags(["-fprofile-instr-generate"]),
            ]
        ),
        .target(
            name: "rAthenaResources",
            path: ".",
            exclude: [
                "3rdparty",
                "doc",
                "src",
                "tools",
            ],
            sources: [
                "Sources/rAthenaResources",
            ],
            resources: [
                .copy("conf"),
                .copy("db"),
                .copy("npc"),
                .copy("sqlite-files"),
                .copy("ragnarok.sqlite3"),
            ],
            plugins: [
                "rAthenaParseRevision",
            ]
        ),
        .target(
            name: "httplib",
            path: "3rdparty/httplib",
            publicHeadersPath: ""
        ),
        .target(
            name: "json",
            path: "3rdparty/json"
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
            exclude: [
                "ext/c4core/src/c4/ext/debugbreak/.gitignore",
                "ext/c4core/src/c4/ext/debugbreak/COPYING",
                "ext/c4core/src/c4/ext/debugbreak/GNUmakefile",
                "ext/c4core/src/c4/ext/debugbreak/HOW-TO-USE-DEBUGBREAK-GDB-PY.md",
                "ext/c4core/src/c4/ext/debugbreak/README.md",
                "ext/c4core/src/c4/ext/debugbreak/debugbreak-gdb.py",
                "ext/c4core/src/c4/ext/fast_float/.cirrus.yml",
                "ext/c4core/src/c4/ext/fast_float/.github",
                "ext/c4core/src/c4/ext/fast_float/.gitignore",
                "ext/c4core/src/c4/ext/fast_float/.travis.yml",
                "ext/c4core/src/c4/ext/fast_float/AUTHORS",
                "ext/c4core/src/c4/ext/fast_float/CMakeLists.txt",
                "ext/c4core/src/c4/ext/fast_float/CONTRIBUTORS",
                "ext/c4core/src/c4/ext/fast_float/LICENSE-APACHE",
                "ext/c4core/src/c4/ext/fast_float/LICENSE-MIT",
                "ext/c4core/src/c4/ext/fast_float/README.md",
                "ext/c4core/src/c4/ext/fast_float/ci",
                "ext/c4core/src/c4/ext/fast_float/cmake",
                "ext/c4core/src/c4/ext/fast_float/script",
                "ext/c4core/src/c4/ext/sg14/README.md",
                "ext/c4core/src/c4/c4core.natvis",
                "src/ryml.natvis",
                "src/ryml-gdbtypes.py",
            ],
            sources: [
                "ext/c4core/src",
                "src",
            ],
            cxxSettings: [
                .headerSearchPath("ext/c4core/src"),
                .headerSearchPath("src"),
            ]
        ),
        .target(
            name: "yaml-cpp",
            path: "3rdparty/yaml-cpp",
            exclude: [
                "src/contrib/yaml-cpp.natvis",
                "src/contrib/yaml-cpp.natvis.md",
            ],
            sources: [
                "src",
            ]
        ),
        .testTarget(
            name: "rAthenaLoginTests",
            dependencies: [
                "rAthenaLogin",
                "rAthenaResources",
            ]
        ),
        .testTarget(
            name: "rAthenaCharTests",
            dependencies: [
                "rAthenaChar",
                "rAthenaResources",
            ]
        ),
        .testTarget(
            name: "rAthenaMapTests",
            dependencies: [
                "rAthenaMap",
                "rAthenaResources",
            ]
        ),
        .testTarget(
            name: "rAthenaWebTests",
            dependencies: [
                "rAthenaWeb",
                "rAthenaResources",
            ]
        ),
        .plugin(
            name: "rAthenaParseRevision",
            capability: .buildTool()
        ),
        .plugin(
            name: "rAthenaExportConstants",
            capability: .command(
                intent: .custom(verb: "export-constants", description: ""),
                permissions: [
                    .writeToPackageDirectory(reason: ""),
                ]
            )
        ),
        .plugin(
            name: "rAthenaReplaceSymlinks",
            capability: .command(
                intent: .custom(verb: "replace-symlinks", description: ""),
                permissions: [
                    .writeToPackageDirectory(reason: ""),
                ]
            )
        ),
    ],
    cxxLanguageStandard: .cxx17
)
