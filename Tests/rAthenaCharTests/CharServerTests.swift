//
//  CharServerTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaChar
@testable import rAthenaResources

final class CharServerTests: XCTestCase {
    override func setUp() async throws {
        let serverResourceManager = ServerResourceManager()
        let workingDirectoryURL = FileManager.default
            .urls(for: .libraryDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("rathena", isDirectory: true)
        try await serverResourceManager.prepareWorkingDirectory(at: workingDirectoryURL)
    }

    func testCharServer() async {
        let charServer = CharServer.shared
        XCTAssertEqual(charServer.name, "Char Server")
        XCTAssertEqual(charServer.status, .notStarted)

        await charServer.start()

        XCTAssertEqual(charServer.status, .running)

        await charServer.stop()

        XCTAssertEqual(charServer.status, .stopped)
    }
}
