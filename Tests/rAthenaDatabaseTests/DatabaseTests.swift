//
//  DatabaseTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2024/1/9.
//

import XCTest
@testable import rAthenaDatabase

final class DatabaseTests: XCTestCase {
    func testFetchItems() throws {
        let items = try Database.renewal.fetchItems()
        XCTAssertEqual(items.count, 24896)
    }

    static var allTests = [
        ("testFetchItems", testFetchItems),
    ]
}
