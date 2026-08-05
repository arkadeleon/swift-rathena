//
//  WebServerTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaWeb
@testable import rAthenaResources

final class WebServerTests: XCTestCase {
    override func setUp() async throws {
        let serverResourceManager = ServerResourceManager()
        let workingDirectoryURL = FileManager.default
            .urls(for: .libraryDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("rathena", isDirectory: true)
        try await serverResourceManager.prepareWorkingDirectory(at: workingDirectoryURL)
    }

    func testWebServer() async {
        let webServer = WebServer.shared
        XCTAssertEqual(webServer.name, "Web Server")
        XCTAssertEqual(webServer.status, .notStarted)

        for _ in 0..<10 {
            await webServer.start()

            XCTAssertEqual(webServer.status, .running)

            await webServer.stop()

            XCTAssertEqual(webServer.status, .stopped)
        }
    }
}
