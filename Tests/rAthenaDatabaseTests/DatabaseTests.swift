//
//  DatabaseTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2024/1/9.
//

import XCTest
@testable import rAthenaDatabase

final class DatabaseTests: XCTestCase {
    func testItemDatabase() async throws {
        let items = try await Database.renewal.fetchItems()
        XCTAssertEqual(items.count, 24896)
    }

    func testMonsterDatabase() async throws {
        let monsters = try await Database.renewal.fetchMonsters()
        XCTAssertEqual(monsters.count, 2445)
    }

    static var allTests = [
        ("testItemDatabase", testItemDatabase),
        ("testMonsterDatabase", testMonsterDatabase),
    ]
}
