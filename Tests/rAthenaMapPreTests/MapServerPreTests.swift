//
//  MapServerPreTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2026/10/27.
//

import XCTest
@testable import rAthenaMapPre
@testable import rAthenaResources

final class MapServerPreTests: XCTestCase {
    override func setUp() async throws {
        let serverResourceManager = ServerResourceManager()
        let workingDirectoryURL = FileManager.default
            .urls(for: .libraryDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("rathena-pre", isDirectory: true)
        try await serverResourceManager.prepareWorkingDirectory(at: workingDirectoryURL)
    }

    func testMapServerPre() async {
        let mapServer = MapServerPre.shared
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
