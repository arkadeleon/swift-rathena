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
    let loginServer = RALoginServer.shared

    override func setUp() async throws {
        try ResourceBundle.shared.load()
        await loginServer.start()
    }

    func testLoginServer() {
        XCTAssertEqual(loginServer.name, "Login Server")
    }

    static var allTests = [
        ("testLoginServer", testLoginServer),
    ]
}
