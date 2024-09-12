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

    public let baseURL: URL

    public var confURL: URL {
        baseURL.appending(path: "conf", directoryHint: .isDirectory)
    }

    public var dbURL: URL {
        baseURL.appending(path: "db", directoryHint: .isDirectory)
    }

    public var npcURL: URL {
        baseURL.appending(path: "npc", directoryHint: .isDirectory)
    }

    public init() {
        let libraryURL = try! FileManager.default.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        baseURL = libraryURL.appending(path: "rathena", directoryHint: .isDirectory)
    }

    public func prepareForServers() throws {
        let fileManager = FileManager.default
        try fileManager.createDirectory(at: baseURL, withIntermediateDirectories: true, attributes: nil)
        fileManager.changeCurrentDirectoryPath(baseURL.path)

        let sourceURL = Bundle.module.resourceURL!
        let sourceDatabaseURL = sourceURL.appending(path: "ragnarok.sqlite3", directoryHint: .notDirectory)

        let databaseURL = baseURL.appending(path: "ragnarok.sqlite3", directoryHint: .notDirectory)
        let revisionURL = baseURL.appending(path: "revision", directoryHint: .notDirectory)

        if !fileManager.fileExists(atPath: databaseURL.path) {
            try fileManager.copyItem(at: sourceDatabaseURL, to: databaseURL)
        }

        try upgradeDatabase(at: databaseURL)

        var needsUpdate = true
        if fileManager.fileExists(atPath: revisionURL.path) {
            let revision = try String(contentsOf: revisionURL, encoding: .utf8)
            if revision == ServerResourceRevision {
                needsUpdate = false
            }
        }

        if needsUpdate {
            let paths = ["conf", "db", "npc"]
            for path in paths {
                let sourceURL = sourceURL.appending(path: path, directoryHint: .isDirectory)
                let url = baseURL.appending(path: path, directoryHint: .isDirectory)
                if fileManager.fileExists(atPath: url.path) {
                    try fileManager.removeItem(at: url)
                }
                try fileManager.copyItem(at: sourceURL, to: url)
            }

            let sourceImportURL = baseURL.appending(path: "conf/import-tmpl", directoryHint: .isDirectory)
            let importURL = baseURL.appending(path: "conf/import", directoryHint: .isDirectory)
            try fileManager.moveItem(at: sourceImportURL, to: importURL)

            try ServerResourceRevision.write(to: revisionURL, atomically: true, encoding: .utf8)
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

        let upgrades: [(id: String, sql: String)] = [
            ("20230224", "ALTER TABLE `char` ADD COLUMN `last_instanceid` INTEGER NOT NULL DEFAULT '0';"),
        ]

        for upgrade in upgrades {
            sql = "SELECT count(*) FROM `upgrades` WHERE `id` = '\(upgrade.id)' LIMIT 1;"
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

            sql = upgrade.sql
            guard sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK else {
                throw SQLite3Error.prepare
            }

            sqlite3_step(stmt)
            sqlite3_finalize(stmt)
            stmt = nil

            sql = "INSERT INTO `upgrades` VALUES ('\(upgrade.id)')"
            guard sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK else {
                throw SQLite3Error.prepare
            }

            sqlite3_step(stmt)
            sqlite3_finalize(stmt)
            stmt = nil
        }
    }
}
