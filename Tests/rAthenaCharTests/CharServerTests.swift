//
//  CharServerTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaResource
@testable import rAthenaChar

final class CharServerTests: XCTestCase {
    let charServer = RACharServer.shared

    override func setUp() async throws {
        try ResourceBundle.shared.load()
        await charServer.start()
    }

    func testCharServer() {
        XCTAssertEqual(charServer.name, "Char Server")
    }

    static var allTests = [
        ("testCharServer", testCharServer),
    ]
}
