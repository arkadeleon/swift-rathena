//
//  WebServerTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaResource
@testable import rAthenaWeb

final class WebServerTests: XCTestCase {
    let resourceManager = RAResourceManager.shared
    let webServer = RAWebServer.shared

    override func setUp() async throws {
        try resourceManager.copyResourceFilesToLibraryDirectory()
//        await webServer.start()
    }

    func testWebServer() {
        XCTAssertEqual(webServer.name, "Web Server")
    }

    static var allTests = [
        ("testWebServer", testWebServer),
    ]
}
