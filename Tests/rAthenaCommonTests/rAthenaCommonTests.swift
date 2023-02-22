//
//  rAthenaCommonTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/22.
//

import XCTest
@testable import rAthenaCommon

class rAthenaCommonTests: XCTestCase {

    func testItemDatabase() async {
        let db = RAItemDatabase()
        let items = await db.fetchAllItems()
        XCTAssert(items.count == 21404)
    }

    static var allTests = [
        ("testItemDatabase", testItemDatabase),
    ]
}
