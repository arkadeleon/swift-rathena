//
//  List.swift
//  rAthena
//
//  Created by Leon Li on 2023/1/20.
//

public struct List<Element: Decodable>: Decodable {

    /// Header.
    var header: Header

    /// Body.
    var body: [Element]

    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case body = "Body"
    }
}

extension List {

    /// Header.
    public struct Header: Decodable {

        /// Type.
        var type: String

        /// Version.
        var version: Int

        enum CodingKeys: String, CodingKey {
            case type = "Type"
            case version = "Version"
        }
    }
}
