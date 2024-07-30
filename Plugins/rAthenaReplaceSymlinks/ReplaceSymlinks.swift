//
//  ReplaceSymlinks.swift
//  rAthena
//
//  Created by Leon Li on 2024/7/29.
//

import Foundation
import PackagePlugin

@main
struct ReplaceSymlinks: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        let loginDir = context.package.directory.appending(["Sources", "rAthenaLogin"])
        let charDir = context.package.directory.appending(["Sources", "rAthenaChar"])
        let mapDir = context.package.directory.appending(["Sources", "rAthenaMap"])
        let webDir = context.package.directory.appending(["Sources", "rAthenaWeb"])

        try replaceSymlinks(in: loginDir)
        try replaceSymlinks(in: charDir)
        try replaceSymlinks(in: mapDir)
        try replaceSymlinks(in: webDir)
    }

    private func replaceSymlinks(in directory: Path) throws {
        let url = URL(fileURLWithPath: directory.string)
        let enumerator = FileManager.default.enumerator(at: url, includingPropertiesForKeys: nil)!
        for item in enumerator {
            let url = item as! URL
            let resolvedURL = url.resolvingSymlinksInPath()
            if resolvedURL != url {
                try FileManager.default.removeItem(at: url)
                try FileManager.default.copyItem(at: resolvedURL, to: url)
            }
        }
    }
}
