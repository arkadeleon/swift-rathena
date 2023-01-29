//
//  List.swift
//  rAthena
//
//  Created by Leon Li on 2023/1/20.
//

public struct List<Element: Decodable>: Decodable {

    public struct Header: Decodable {

        enum CodingKeys: String, CodingKey {
            case type = "Type"
            case version = "Version"
        }

        /// Type
        var type: String

        /// Version
        var version: Int
    }

    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case body = "Body"
    }

    /// Header
    var header: Header

    /// Body
    var body: [Element]
}
