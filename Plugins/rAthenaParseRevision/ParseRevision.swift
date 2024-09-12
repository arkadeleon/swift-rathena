//
//  ParseRevision.swift
//  rAthena
//
//  Created by Leon Li on 2024/8/15.
//

import Foundation
import PackagePlugin

@main
struct ParseRevision: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: any Target) async throws -> [Command] {
        let process = Process()
        process.executableURL = try context.tool(named: "git").url
        process.arguments = ["rev-parse", "HEAD"]

        let pipe = Pipe()
        process.standardOutput = pipe

        try process.run()
        process.waitUntilExit()

        let data = try pipe.fileHandleForReading.readToEnd()!
        let string = String(data: data, encoding: .utf8)!.trimmingCharacters(in: .newlines)

        let tempURL = context.pluginWorkDirectoryURL.appending(path: "Temp.swift")
        let outputURL = context.pluginWorkDirectoryURL.appending(path: "ServerResourceRevision.swift")

        try "public let serverResourceRevision = \"\(string)\"".write(to: tempURL, atomically: true, encoding: .utf8)

        return [
            .buildCommand(
                displayName: "Parse Revision",
                executable: try context.tool(named: "mv").url,
                arguments: [tempURL.path(), outputURL.path()],
                outputFiles: [outputURL]
            )
        ]
    }
}
