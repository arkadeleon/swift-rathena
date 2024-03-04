//
//  MapServerTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaResource
@testable import rAthenaMap

final class MapServerTests: XCTestCase {
    let mapServer = RAMapServer.shared

    override func setUp() async throws {
        try ResourceBundle.shared.load()
        await mapServer.start()
    }

    func testMapServer() {
        XCTAssertEqual(mapServer.name, "Map Server")
    }

    static var allTests = [
        ("testMapServer", testMapServer),
    ]
}
