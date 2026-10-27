//
//  WebServerPreTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2026/10/27.
//

import XCTest
@testable import rAthenaWebPre
@testable import rAthenaResources

final class WebServerPreTests: XCTestCase {
    override func setUp() async throws {
        let serverResourceManager = ServerResourceManager()
        let workingDirectoryURL = FileManager.default
            .urls(for: .libraryDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("rathena", isDirectory: true)
        try await serverResourceManager.prepareWorkingDirectory(at: workingDirectoryURL, mode: .prerenewal)
    }

    func testWebServerPre() async {
        let webServer = WebServerPre.shared
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
