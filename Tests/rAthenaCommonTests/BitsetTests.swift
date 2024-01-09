//
//  BitsetTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/22.
//

import XCTest
@testable import rAthenaCommon

final class BitsetTests: XCTestCase {
    func testBitset() {
        let bitset = RABitset(value: 0x0000000000000007)
        XCTAssertTrue(bitset[0])
        XCTAssertTrue(bitset[1])
        XCTAssertTrue(bitset[2])
        XCTAssertFalse(bitset[3])
    }

    static var allTests = [
        ("testBitset", testBitset),
    ]
}
