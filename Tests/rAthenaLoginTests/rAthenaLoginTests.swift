//
//  rAthenaLoginTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/13.
//

import XCTest
@testable import rAthenaLogin
@testable import rAthenaResource

class rAthenaLoginTests: XCTestCase {

    func testLoginServer() {
        let resourceManager = ResourceManager()
        try! resourceManager.copyBundleResourceFiles()

        let loginServer = RALoginServer()
        loginServer.start()

        XCTAssert(loginServer.name == "Login Server")
    }

    static var allTests = [
        ("testLoginServer", testLoginServer),
    ]
}
