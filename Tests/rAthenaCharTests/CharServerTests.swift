//
//  CharServerTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaResource
@testable import rAthenaChar

final class CharServerTests: XCTestCase {
    override func setUp() async throws {
        try await ResourceBundle.shared.load()
    }

    func testCharServer() async {
        let charServer = CharServer.shared
        XCTAssertEqual(charServer.name, "Char Server")
        XCTAssertEqual(charServer.status, .notStarted)

        await charServer.start()

        XCTAssertEqual(charServer.status, .running)
    }

    static var allTests = [
        ("testCharServer", testCharServer),
    ]
}
