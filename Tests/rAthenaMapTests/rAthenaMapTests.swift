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
    let resourceManager = RAResourceManager.shared
    let mapServer = RAMapServer.shared

    override func setUp() async throws {
        resourceManager.copyResourcesToLibraryDirectory()
        await mapServer.start()
    }

    func testMapServer() {
        XCTAssertEqual(mapServer.name, "Map Server")
    }

    static var allTests = [
        ("testMapServer", testMapServer),
    ]
}
