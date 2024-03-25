//
//  LoginServerTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/13.
//

import XCTest
@testable import rAthenaResource
@testable import rAthenaLogin

final class LoginServerTests: XCTestCase {
    override func setUp() async throws {
        try ResourceBundle.shared.load()
    }

    func testLoginServer() async {
        let loginServer = RALoginServer.shared
        XCTAssertEqual(loginServer.name, "Login Server")
        XCTAssertEqual(loginServer.status, .notStarted)

        await loginServer.start()

        XCTAssertEqual(loginServer.status, .running)
    }

    static var allTests = [
        ("testLoginServer", testLoginServer),
    ]
}
