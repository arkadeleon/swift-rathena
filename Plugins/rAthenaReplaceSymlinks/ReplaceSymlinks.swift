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
        let loginURL = context.package.directoryURL.appending(path: "Sources/rAthenaLogin")
        let charURL = context.package.directoryURL.appending(path: "Sources/rAthenaChar")
        let mapURL = context.package.directoryURL.appending(path: "Sources/rAthenaMap")
        let webURL = context.package.directoryURL.appending(path: "Sources/rAthenaWeb")

        try replaceSymlinks(at: loginURL)
        try replaceSymlinks(at: charURL)
        try replaceSymlinks(at: mapURL)
        try replaceSymlinks(at: webURL)
    }

    private func replaceSymlinks(at url: URL) throws {
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
