//
//  rAthenaWebTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaWeb
@testable import rAthenaResource

class rAthenaWebTests: XCTestCase {

    func testWebServer() {
        let resourceManager = ResourceManager()
        try! resourceManager.copyBundleResourceFiles()

        let webServer = RAWebServer()
//        webServer.start()

        XCTAssert(webServer.name == "Web Server")
    }

    static var allTests = [
        ("testWebServer", testWebServer),
    ]
}
