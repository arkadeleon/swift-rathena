//
//  ParseRevision.swift
//  rAthena
//
//  Created by Leon Li on 2024/8/15.
//

import CryptoKit
import Foundation
import PackagePlugin

@main
struct ParseRevision: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: any Target) async throws -> [Command] {
        let revision = try gitRevision(context: context) ?? resourceRevision(context: context)

        let tempURL = context.pluginWorkDirectoryURL.appending(path: "Temp.swift")
        let outputURL = context.pluginWorkDirectoryURL.appending(path: "ServerResourceRevision.swift")

        try "public let serverResourceRevision = \"\(revision)\"".write(to: tempURL, atomically: true, encoding: .utf8)

        return [
            .buildCommand(
                displayName: "Parse Revision",
                executable: URL(filePath: "/bin/mv"),
                arguments: [tempURL.path(), outputURL.path()],
                outputFiles: [outputURL]
            )
        ]
    }

    private func gitRevision(context: PluginContext) -> String? {
        do {
            let process = Process()
            process.executableURL = URL(filePath: "/usr/bin/git")
            process.arguments = ["rev-parse", "--verify", "HEAD^{commit}"]
            process.currentDirectoryURL = context.package.directoryURL

            let pipe = Pipe()
            process.standardOutput = pipe
            process.standardError = FileHandle.nullDevice

            try process.run()
            process.waitUntilExit()

            guard process.terminationStatus == 0,
                  let data = try pipe.fileHandleForReading.readToEnd(),
                  let revision = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines),
                  !revision.isEmpty else {
                return nil
            }

            return revision
        } catch {
            return nil
        }
    }

    private func resourceRevision(context: PluginContext) throws -> String {
        var hasher = Insecure.SHA1()
        let resourcePaths = [
            "conf",
            "db",
            "npc",
            "sqlite-files",
            "ragnarok.sqlite3",
        ]

        for resourcePath in resourcePaths {
            let url = context.package.directoryURL.appending(path: resourcePath)
            try hashResource(at: url, relativePath: resourcePath, into: &hasher)
        }

        return hasher.finalize()
            .map { String(format: "%02x", $0) }
            .joined()
    }

    private func hashResource(
        at url: URL,
        relativePath: String,
        into hasher: inout Insecure.SHA1
    ) throws {
        let resourceValues = try url.resourceValues(forKeys: [
            .isDirectoryKey,
            .isRegularFileKey,
            .isSymbolicLinkKey,
        ])

        if resourceValues.isSymbolicLink == true {
            updateHash(with: "symlink", into: &hasher)
            updateHash(with: relativePath, into: &hasher)
            let destination = try FileManager.default.destinationOfSymbolicLink(atPath: url.path())
            updateHash(with: destination, into: &hasher)
        } else if resourceValues.isDirectory == true {
            updateHash(with: "directory", into: &hasher)
            updateHash(with: relativePath, into: &hasher)

            let children = try FileManager.default.contentsOfDirectory(
                at: url,
                includingPropertiesForKeys: nil
            ).sorted { $0.lastPathComponent < $1.lastPathComponent }

            for child in children {
                try hashResource(
                    at: child,
                    relativePath: relativePath + "/" + child.lastPathComponent,
                    into: &hasher
                )
            }
        } else if resourceValues.isRegularFile == true {
            updateHash(with: "file", into: &hasher)
            updateHash(with: relativePath, into: &hasher)
            updateHash(with: try Data(contentsOf: url, options: .mappedIfSafe), into: &hasher)
        }
    }

    private func updateHash(with string: String, into hasher: inout Insecure.SHA1) {
        updateHash(with: Data(string.utf8), into: &hasher)
    }

    private func updateHash(with data: Data, into hasher: inout Insecure.SHA1) {
        let length = withUnsafeBytes(of: UInt64(data.count).bigEndian) { Data($0) }
        hasher.update(data: length)
        hasher.update(data: data)
    }
}
