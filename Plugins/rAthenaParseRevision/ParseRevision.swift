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
        process.executableURL = try URL(filePath: context.tool(named: "git").path.string)
        process.arguments = ["rev-parse", "HEAD"]

        let pipe = Pipe()
        process.standardOutput = pipe

        try process.run()
        process.waitUntilExit()

        let data = try pipe.fileHandleForReading.readToEnd()!
        let string = String(data: data, encoding: .utf8)!.trimmingCharacters(in: .newlines)

        let temp = context.pluginWorkDirectory.appending(["Temp.swift"])
        let output = context.pluginWorkDirectory.appending(["ServerResourceRevision.swift"])

        try "let ServerResourceRevision = \"\(string)\"".write(toFile: temp.string, atomically: true, encoding: .utf8)

        return [
            .buildCommand(
                displayName: "Parse Revision",
                executable: try context.tool(named: "mv").path,
                arguments: [temp.string, output.string],
                outputFiles: [output]
            )
        ]
    }
}
