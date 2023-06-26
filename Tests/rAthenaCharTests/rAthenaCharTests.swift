//
//  rAthenaCharTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaCommon
@testable import rAthenaChar

class rAthenaCharTests: XCTestCase {
    let resourceManager = RAResourceManager.shared
    let charServer = RACharServer.shared

    override func setUp() async throws {
        resourceManager.copyResourcesToLibraryDirectory()
        await charServer.start()
    }

    func testCharServer() {
        XCTAssertEqual(charServer.name, "Char Server")
    }

    static var allTests = [
        ("testCharServer", testCharServer),
    ]
}
