//
//  MapServerTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaMap
@testable import rAthenaResource

final class MapServerTests: XCTestCase {
    override func setUp() async throws {
        try await ResourceBundle.shared.load()
    }

    func testMapServer() async {
        let mapServer = MapServer.shared
        XCTAssertEqual(mapServer.name, "Map Server")
        XCTAssertEqual(mapServer.status, .notStarted)

        await mapServer.start()

        XCTAssertEqual(mapServer.status, .running)
    }

    static var allTests = [
        ("testMapServer", testMapServer),
    ]
}
