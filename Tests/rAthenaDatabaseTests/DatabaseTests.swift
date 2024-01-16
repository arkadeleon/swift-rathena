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

    func testJobDatabase() async throws {
        let jobs = try await Database.renewal.fetchJobs()
//        XCTAssertEqual(jobs.count, 181)
    }

    func testSkillDatabase() async throws {
        let skills = try await Database.renewal.fetchSkills()
        XCTAssertEqual(skills.count, 1502)
    }

    func testSkillTreeDatabase() async throws {
        let skillTrees = try await Database.renewal.fetchSkillTrees()
        XCTAssertEqual(skillTrees.count, 167)
    }

    static var allTests = [
        ("testItemDatabase", testItemDatabase),
        ("testMonsterDatabase", testMonsterDatabase),
        ("testJobDatabase", testJobDatabase),
        ("testSkillDatabase", testSkillDatabase),
        ("testSkillTreeDatabase", testSkillTreeDatabase),
    ]
}
