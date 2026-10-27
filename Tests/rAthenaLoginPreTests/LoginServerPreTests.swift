//
//  LoginServerPreTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2026/10/27.
//

import XCTest
@testable import rAthenaLoginPre
@testable import rAthenaResources

final class LoginServerPreTests: XCTestCase {
    override func setUp() async throws {
        let serverResourceManager = ServerResourceManager()
        let workingDirectoryURL = FileManager.default
            .urls(for: .libraryDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("rathena-pre", isDirectory: true)
        try await serverResourceManager.prepareWorkingDirectory(at: workingDirectoryURL)
    }

    func testLoginServerPre() async {
        let loginServer = LoginServerPre.shared
        XCTAssertEqual(loginServer.name, "Login Server")
        XCTAssertEqual(loginServer.status, .notStarted)

        for _ in 0..<10 {
            await loginServer.start()

            XCTAssertEqual(loginServer.status, .running)

            await loginServer.stop()

            XCTAssertEqual(loginServer.status, .stopped)
        }
    }
}
