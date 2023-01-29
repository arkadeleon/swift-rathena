//
//  rAthenaDatabaseTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/1/20.
//

import XCTest
@testable import rAthenaDatabase

class rAthenaDatabaseTests: XCTestCase {

    func testFetchItems() {
        let items = Database.renewal.fetchItems()
        XCTAssert(items.count == 21404)
    }

    static var allTests = [
        ("testFetchItems", testFetchItems),
    ]
}
