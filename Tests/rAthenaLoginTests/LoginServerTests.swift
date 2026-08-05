//
//  LoginServerTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/13.
//

import XCTest
@testable import rAthenaLogin
@testable import rAthenaResources

final class LoginServerTests: XCTestCase {
    override func setUp() async throws {
        let serverResourceManager = ServerResourceManager()
        let workingDirectoryURL = FileManager.default
            .urls(for: .libraryDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("rathena", isDirectory: true)
        try await serverResourceManager.prepareWorkingDirectory(at: workingDirectoryURL)
    }

    func testLoginServer() async {
        let loginServer = LoginServer.shared
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
