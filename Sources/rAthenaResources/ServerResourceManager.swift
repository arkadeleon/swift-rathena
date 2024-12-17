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

final public class ServerResourceManager: Sendable {
    public static let `default` = ServerResourceManager()

    public let sourceURL: URL
    public let workingDirectoryURL: URL

    public init() {
        sourceURL = Bundle.module.resourceURL!

        let libraryDirectoryURL = try! FileManager.default.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        workingDirectoryURL = libraryDirectoryURL.appending(path: "rathena", directoryHint: .isDirectory)
    }

    public func prepareWorkingDirectory() throws {
        let fileManager = FileManager.default
        try fileManager.createDirectory(at: workingDirectoryURL, withIntermediateDirectories: true, attributes: nil)
        fileManager.changeCurrentDirectoryPath(workingDirectoryURL.path)

        let sourceDatabaseURL = sourceURL.appending(path: "ragnarok.sqlite3", directoryHint: .notDirectory)

        let databaseURL = workingDirectoryURL.appending(path: "ragnarok.sqlite3", directoryHint: .notDirectory)
        let revisionURL = workingDirectoryURL.appending(path: "revision", directoryHint: .notDirectory)

        if !fileManager.fileExists(atPath: databaseURL.path) {
            try fileManager.copyItem(at: sourceDatabaseURL, to: databaseURL)
        }

        try upgradeDatabase(at: databaseURL)

        var needsUpdate = true
        if fileManager.fileExists(atPath: revisionURL.path) {
            let revision = try String(contentsOf: revisionURL, encoding: .utf8)
            if revision == serverResourceRevision {
                needsUpdate = false
            }
        }

        if needsUpdate {
            let paths = ["conf", "db", "npc"]
            for path in paths {
                let sourceURL = sourceURL.appending(path: path, directoryHint: .isDirectory)
                let url = workingDirectoryURL.appending(path: path, directoryHint: .isDirectory)
                if fileManager.fileExists(atPath: url.path) {
                    try fileManager.removeItem(at: url)
                }
                try fileManager.copyItem(at: sourceURL, to: url)
            }

            let sourceImportURL = workingDirectoryURL.appending(path: "conf/import-tmpl", directoryHint: .isDirectory)
            let importURL = workingDirectoryURL.appending(path: "conf/import", directoryHint: .isDirectory)
            try fileManager.moveItem(at: sourceImportURL, to: importURL)

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

        var sql: String?
        var stmt: OpaquePointer?

        sql = "CREATE TABLE IF NOT EXISTS `upgrades` (`id` TEXT NOT NULL, PRIMARY KEY (id));"
        guard (sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK) else {
            throw SQLite3Error.prepare
        }

        sqlite3_step(stmt);
        sqlite3_finalize(stmt);
        stmt = nil;

        let upgrades: KeyValuePairs<String, [String]> = [
            "20230224": [
                "ALTER TABLE `char` ADD COLUMN `last_instanceid` INTEGER NOT NULL DEFAULT '0';",
            ],
            "20240803": [
                "UPDATE `char_reg_num` SET `key` = 'ep18_main' WHERE `key` = 'ep18_1_main';",
            ],
            "20240914": [
                "ALTER TABLE `guild_expulsion` ADD COLUMN `char_id` INTEGER NOT NULL DEFAULT '0';",
            ],
            "20241216": [
                """
                CREATE TABLE IF NOT EXISTS `skillcooldown_homunculus` (
                  `homun_id` INTEGER NOT NULL PRIMARY KEY,
                  `skill` INTEGER NOT NULL DEFAULT '0',
                  `tick` INTEGER NOT NULL
                );
                """,
                """
                CREATE TABLE IF NOT EXISTS `skillcooldown_mercenary` (
                  `mer_id` INTEGER NOT NULL PRIMARY KEY,
                  `skill` INTEGER NOT NULL DEFAULT '0',
                  `tick` INTEGER NOT NULL
                );
                """,
            ],
        ]

        for upgrade in upgrades {
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

            let sqls = upgrade.value
            for sql in sqls {
                guard sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK else {
                    throw SQLite3Error.prepare
                }

                sqlite3_step(stmt)
                sqlite3_finalize(stmt)
                stmt = nil
            }

            sql = "INSERT INTO `upgrades` VALUES ('\(upgrade.key)')"
            guard sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK else {
                throw SQLite3Error.prepare
            }

            sqlite3_step(stmt)
            sqlite3_finalize(stmt)
            stmt = nil
        }
    }
}
