//
//  RAResourceManager.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/29.
//

import Foundation
import SQLite3

public class RAResourceManager {
    public static let shared = RAResourceManager()

    private let fileManager: FileManager
    private let sourceURL: URL
    private let destinationURL: URL

    public init() {
        fileManager = FileManager()
        sourceURL = Bundle.module.resourceURL!
        destinationURL = try! fileManager.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("rathena")
    }

    public func data(forResource name: String) throws -> Data {
        let url = Bundle.module.resourceURL!.appendingPathComponent(name)
        let data = try Data(contentsOf: url)
        return data
    }

    public func copyResourceFilesToLibraryDirectory() throws {
        try fileManager.createDirectory(at: destinationURL, withIntermediateDirectories: true, attributes: nil)
        fileManager.changeCurrentDirectoryPath(destinationURL.path)

        let sourceDatabaseURL = sourceURL.appendingPathComponent("ragnarok.sqlite3")
        let destinationDatabaseURL = destinationURL.appendingPathComponent("ragnarok.sqlite3")
        if !fileManager.fileExists(atPath: destinationDatabaseURL.path) {
            try fileManager.copyItem(at: sourceDatabaseURL, to: destinationDatabaseURL)
        }

        let paths = ["conf", "db", "npc"]
        for path in paths {
            let sourceURL = sourceURL.appendingPathComponent(path)
            let destinationURL = destinationURL.appendingPathComponent(path)
            if fileManager.fileExists(atPath: destinationURL.path) {
                try fileManager.removeItem(at: destinationURL)
            }
            try fileManager.copyItem(at: sourceURL, to: destinationURL)
        }

        try fileManager.moveItem(at: destinationURL.appendingPathComponent("conf/import-tmpl"), to: destinationURL.appendingPathComponent("conf/import"))

        try upgradeDatabase(at: destinationDatabaseURL)
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
