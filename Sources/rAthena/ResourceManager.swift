//
//  ResourceManager.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/29.
//

import Foundation
import SQLite3

public class ResourceManager {

    private let fileManager: FileManager
    private let sourceURL: URL
    private let destinationURL: URL

    public static let shared = ResourceManager()

    private init() {
        fileManager = FileManager()
        sourceURL = Bundle(for: ResourceManager.self).resourceURL!
        destinationURL = try! fileManager.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("rathena")
    }

    public func copyBundleResourceFiles() throws {
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

//        try upgradeDatabase(at: destinationDatabaseURL)
    }

    private func upgradeDatabase(at url: URL) throws {
        var db: OpaquePointer?
        guard sqlite3_open(url.path, &db) == SQLITE_OK else {
            return
        }

        let upgradeFilesDirectory = sourceURL.appendingPathComponent("sql-files/upgrades")
        let upgradeFiles = try fileManager.contentsOfDirectory(at: upgradeFilesDirectory, includingPropertiesForKeys: nil, options: []).sorted(by: { $0.path < $1.path })

        for upgradeFile in upgradeFiles {
            let upgradeID = (upgradeFile.lastPathComponent as NSString).deletingPathExtension

            if !upgradeID.hasPrefix("upgrade_") {
                continue
            }

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

            sql = try String(contentsOf: upgradeFile)
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
