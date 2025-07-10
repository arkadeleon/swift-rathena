//
//  ServerResourceManager.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/29.
//

import Foundation
import SQLite3

enum SQLite3Error: Error {
    case open
    case prepare
}

public actor ServerResourceManager {
    public static let `shared` = ServerResourceManager()

    nonisolated public let sourceURL: URL
    nonisolated public let workingDirectoryURL: URL

    init() {
        sourceURL = Bundle.module.resourceURL!
        workingDirectoryURL = URL.libraryDirectory.appending(path: "rathena", directoryHint: .isDirectory)
    }

    public func prepareWorkingDirectory() throws {
        let fileManager = FileManager.default
        try fileManager.createDirectory(at: workingDirectoryURL, withIntermediateDirectories: true, attributes: nil)
        fileManager.changeCurrentDirectoryPath(workingDirectoryURL.path)

        let sourceDatabaseURL = sourceURL.appending(path: "ragnarok.sqlite3", directoryHint: .notDirectory)
        let workingDatabaseURL = workingDirectoryURL.appending(path: "ragnarok.sqlite3", directoryHint: .notDirectory)

        if !fileManager.fileExists(atPath: workingDatabaseURL.path) {
            try fileManager.copyItem(at: sourceDatabaseURL, to: workingDatabaseURL)
        }

        let revisionURL = workingDirectoryURL.appending(path: "revision", directoryHint: .notDirectory)

        var needsUpdate = true
        if fileManager.fileExists(atPath: revisionURL.path) {
            let revision = try String(contentsOf: revisionURL, encoding: .utf8)
            if revision == serverResourceRevision {
                needsUpdate = false
            }
        }

        if needsUpdate {
            try upgradeDatabase(at: workingDatabaseURL)

            let paths = ["conf", "db", "npc"]
            for path in paths {
                let sourceURL = sourceURL.appending(path: path, directoryHint: .isDirectory)
                let workingURL = workingDirectoryURL.appending(path: path, directoryHint: .isDirectory)
                if fileManager.fileExists(atPath: workingURL.path) {
                    try fileManager.removeItem(at: workingURL)
                }
                try fileManager.copyItem(at: sourceURL, to: workingURL)
            }

            let importTemplateURL = workingDirectoryURL.appending(path: "conf/import-tmpl", directoryHint: .isDirectory)
            let importURL = workingDirectoryURL.appending(path: "conf/import", directoryHint: .isDirectory)
            try fileManager.moveItem(at: importTemplateURL, to: importURL)

            try serverResourceRevision.write(to: revisionURL, atomically: true, encoding: .utf8)
        }
    }

    private func upgradeDatabase(at url: URL) throws {
        var db: OpaquePointer?

        guard sqlite3_open(url.path, &db) == SQLITE_OK else {
            throw SQLite3Error.open
        }

        defer {
            sqlite3_close(db)
        }

        let sql = """
            CREATE TABLE IF NOT EXISTS `upgrades` (
              `id` TEXT NOT NULL,
              PRIMARY KEY (id)
            );
            """
        guard sqlite3_exec(db, sql, nil, nil, nil) == SQLITE_OK else {
            throw SQLite3Error.prepare
        }

        let upgrades: KeyValuePairs<String, String> = [
            "web": "web.sql",
            "20230224": "upgrades/upgrade_20230224.sql",
            "20240803": "upgrades/upgrade_20240803.sql",
            "20240914": "upgrades/upgrade_20240914.sql",
            "20241216": "upgrades/upgrade_20241216.sql",
            "20250126": "upgrades/upgrade_20250126.sql",
            "20250201": "upgrades/upgrade_20250201.sql",
        ]

        for upgrade in upgrades {
            var sql: String?
            var stmt: OpaquePointer?

            sql = "SELECT count(*) FROM `upgrades` WHERE `id` = '\(upgrade.key)' LIMIT 1;"
            guard sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK else {
                throw SQLite3Error.prepare
            }

            sqlite3_step(stmt)
            let count = sqlite3_column_int(stmt, 0)
            sqlite3_finalize(stmt)
            stmt = nil

            if count == 1 {
                continue
            }

            let url = Bundle.module.resourceURL!.appending(path: "sqlite-files").appending(path: upgrade.value)
            sql = try String(contentsOf: url, encoding: .utf8)
            guard sqlite3_exec(db, sql, nil, nil, nil) == SQLITE_OK else {
                throw SQLite3Error.prepare
            }

            sql = "INSERT INTO `upgrades` VALUES ('\(upgrade.key)');"
            guard sqlite3_exec(db, sql, nil, nil, nil) == SQLITE_OK else {
                throw SQLite3Error.prepare
            }
        }
    }
}
