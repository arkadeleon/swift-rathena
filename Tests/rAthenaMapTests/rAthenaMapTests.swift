//
//  rAthenaMapTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaMap
@testable import rAthenaResource

class rAthenaMapTests: XCTestCase {

    func testMapServer() {
        let resourceManager = ResourceManager()
        try! resourceManager.copyBundleResourceFiles()

        let mapServer = RAMapServer()
        mapServer.start()

        XCTAssert(mapServer.name == "Map Server")
    }

    static var allTests = [
        ("testMapServer", testMapServer),
    ]
}
