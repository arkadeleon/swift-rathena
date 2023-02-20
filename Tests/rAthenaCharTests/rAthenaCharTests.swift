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

    func testCharServer() {
        RAResourceManager.shared.copyResourcesToLibraryDirectory()

        let charServer = RACharServer()
        charServer.start()

        XCTAssert(charServer.name == "Char Server")
    }

    static var allTests = [
        ("testCharServer", testCharServer),
    ]
}
