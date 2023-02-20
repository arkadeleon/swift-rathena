//
//  rAthenaLoginTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/13.
//

import XCTest
@testable import rAthenaCommon
@testable import rAthenaLogin

class rAthenaLoginTests: XCTestCase {

    func testLoginServer() {
        RAResourceManager.shared.copyResourcesToLibraryDirectory()

        let loginServer = RALoginServer()
        loginServer.start()

        XCTAssert(loginServer.name == "Login Server")
    }

    static var allTests = [
        ("testLoginServer", testLoginServer),
    ]
}
