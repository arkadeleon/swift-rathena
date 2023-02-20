//
//  rAthenaMapTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaCommon
@testable import rAthenaMap

class rAthenaMapTests: XCTestCase {

    func testMapServer() {
        RAResourceManager.shared.copyResourcesToLibraryDirectory()

        let mapServer = RAMapServer()
        mapServer.start()

        XCTAssert(mapServer.name == "Map Server")
    }

    static var allTests = [
        ("testMapServer", testMapServer),
    ]
}
