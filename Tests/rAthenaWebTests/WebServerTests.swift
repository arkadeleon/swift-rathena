//
//  WebServerTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaWeb
@testable import rAthenaResource

final class WebServerTests: XCTestCase {
    override func setUp() async throws {
        try await ResourceBundle.shared.load()
    }

    func testWebServer() async {
        let webServer = WebServer.shared
        XCTAssertEqual(webServer.name, "Web Server")
        XCTAssertEqual(webServer.status, .notStarted)

//        await webServer.start()

//        XCTAssertEqual(webServer.status, .running)
    }

    static var allTests = [
        ("testWebServer", testWebServer),
    ]
}
