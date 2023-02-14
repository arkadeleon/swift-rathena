//
//  rAthenaCharTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaChar
@testable import rAthenaResource

class rAthenaCharTests: XCTestCase {

    func testCharServer() {
        let resourceManager = ResourceManager()
        try! resourceManager.copyBundleResourceFiles()

        let charServer = RACharServer()
        charServer.start()

        XCTAssert(charServer.name == "Char Server")
    }

    static var allTests = [
        ("testCharServer", testCharServer),
    ]
}
