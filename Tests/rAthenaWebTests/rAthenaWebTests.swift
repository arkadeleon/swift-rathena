//
//  rAthenaWebTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaCommon
@testable import rAthenaWeb

class rAthenaWebTests: XCTestCase {

    func testWebServer() {
        RAResourceManager.shared.copyResourcesToLibraryDirectory()

        let webServer = RAWebServer()
//        webServer.start()

        XCTAssert(webServer.name == "Web Server")
    }

    static var allTests = [
        ("testWebServer", testWebServer),
    ]
}
