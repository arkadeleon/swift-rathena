//
//  ResourceBundle.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/29.
//

import Foundation
import SQLite3

public class ResourceBundle {
    public static let shared = ResourceBundle()

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
        let fileManager = FileManager.default
        let libraryURL = try! fileManager.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        url = libraryURL.appendingPathComponent("rathena")
    }

    public func load() throws {
        let fileManager = FileManager.default
        try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        fileManager.changeCurrentDirectoryPath(url.path)

        let sourceURL = Bundle.module.resourceURL!
        let sourceDatabaseURL = sourceURL.appendingPathComponent("ragnarok.sqlite3")
        let databaseURL = url.appendingPathComponent("ragnarok.sqlite3")
        if !fileManager.fileExists(atPath: databaseURL.path) {
            try fileManager.copyItem(at: sourceDatabaseURL, to: databaseURL)
        }

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

        try upgradeDatabase(at: databaseURL)
    }

    private func upgradeDatabase(at url: URL) throws {
        var db: OpaquePointer?
        guard sqlite3_open(url.path, &db) == SQLITE_OK else {
            return
        }

        let sql = "CREATE TABLE IF NOT EXISTS `upgrades` (`id` TEXT NOT NULL, PRIMARY KEY (id));"
        var stmt: OpaquePointer?
        if (sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK) {
            sqlite3_step(stmt);
            sqlite3_finalize(stmt);
            stmt = nil;
        }

        let upgrades = [
            "20230224": "ALTER TABLE `char` ADD COLUMN `last_instanceid` INTEGER NOT NULL DEFAULT '0';",
        ]

        let upgradeIDs = upgrades.keys.sorted()
        for upgradeID in upgradeIDs {
            var sql = ""
            var stmt: OpaquePointer?

            sql = "SELECT count(*) FROM upgrades WHERE id = '\(upgradeID)' LIMIT 1"
            if sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK {
                sqlite3_step(stmt)
                let count = sqlite3_column_int(stmt, 0)
                sqlite3_finalize(stmt)
                stmt = nil
                if count == 1 {
                    continue
                }
            }

            sql = upgrades[upgradeID]!
            if sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK {
                sqlite3_step(stmt)
                sqlite3_finalize(stmt)
                stmt = nil
            }

            sql = "INSERT INTO upgrades VALUES ('\(upgradeID)')"
            if sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK {
                sqlite3_step(stmt)
                sqlite3_finalize(stmt)
                stmt = nil
            }
        }

        sqlite3_close(db)
    }
}
