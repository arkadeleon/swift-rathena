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
        try ServerResourceManager.default.prepareForServers()
    }

    func testLoginServer() async {
        let loginServer = LoginServer.shared
        XCTAssertEqual(loginServer.name, "Login Server")
        XCTAssertEqual(loginServer.status, .notStarted)

        await loginServer.start()

        XCTAssertEqual(loginServer.status, .running)
    }
}
