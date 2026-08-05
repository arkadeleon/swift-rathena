//
//  MapServerTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaMap
@testable import rAthenaResources

final class MapServerTests: XCTestCase {
    override func setUp() async throws {
        let serverResourceManager = ServerResourceManager()
        let workingDirectoryURL = FileManager.default
            .urls(for: .libraryDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("rathena", isDirectory: true)
        try await serverResourceManager.prepareWorkingDirectory(at: workingDirectoryURL)
    }

    func testMapServer() async {
        let mapServer = MapServer.shared
        XCTAssertEqual(mapServer.name, "Map Server")
        XCTAssertEqual(mapServer.status, .notStarted)

        for _ in 0..<10 {
            await mapServer.start()

            XCTAssertEqual(mapServer.status, .running)

            await mapServer.stop()

            XCTAssertEqual(mapServer.status, .stopped)
        }
    }
}
