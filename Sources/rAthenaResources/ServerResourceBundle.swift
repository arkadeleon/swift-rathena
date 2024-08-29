//
//  ServerResourceBundle.swift
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

final public class ServerResourceBundle: Sendable {
    public static let shared = ServerResourceBundle()

    public let url: URL

    public var confURL: URL {
        url.appendingPathComponent("conf")
    }

    public var dbURL: URL {
        url.appendingPathComponent("db")
    }

    public var npcURL: URL {
        url.appendingPathComponent("npc")
    }

    public init() {
        let libraryURL = try! FileManager.default.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        url = libraryURL.appendingPathComponent("rathena")
    }

    public func load() async throws {
        let fileManager = FileManager.default
        try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        fileManager.changeCurrentDirectoryPath(url.path)

        let sourceURL = Bundle.module.resourceURL!
        let sourceDatabaseURL = sourceURL.appendingPathComponent("ragnarok.sqlite3")

        let databaseURL = url.appendingPathComponent("ragnarok.sqlite3")
        let revisionURL = url.appendingPathComponent("revision")

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
                let sourceURL = sourceURL.appendingPathComponent(path)
                let url = url.appendingPathComponent(path)
                if fileManager.fileExists(atPath: url.path) {
                    try fileManager.removeItem(at: url)
                }
                try fileManager.copyItem(at: sourceURL, to: url)
            }

            try fileManager.moveItem(at: url.appendingPathComponent("conf/import-tmpl"), to: url.appendingPathComponent("conf/import"))

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
