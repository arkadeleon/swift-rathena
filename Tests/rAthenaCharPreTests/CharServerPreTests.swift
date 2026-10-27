//
//  CharServerPreTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2026/10/27.
//

import XCTest
@testable import rAthenaCharPre
@testable import rAthenaResources

final class CharServerPreTests: XCTestCase {
    override func setUp() async throws {
        let serverResourceManager = ServerResourceManager()
        let workingDirectoryURL = FileManager.default
            .urls(for: .libraryDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("rathena", isDirectory: true)
        try await serverResourceManager.prepareWorkingDirectory(at: workingDirectoryURL, mode: .prerenewal)
    }

    func testCharServerPre() async {
        let charServer = CharServerPre.shared
        XCTAssertEqual(charServer.name, "Char Server")
        XCTAssertEqual(charServer.status, .notStarted)

        for _ in 0..<10 {
            await charServer.start()

            XCTAssertEqual(charServer.status, .running)

            await charServer.stop()

            XCTAssertEqual(charServer.status, .stopped)
        }
    }
}
