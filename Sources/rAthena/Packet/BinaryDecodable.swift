//
//  BinaryDecodable.swift
//  rAthena
//
//  Created by Leon Li on 2021/6/28.
//

public protocol BinaryDecodable {

    init(from decoder: BinaryDecoder) throws
}

public protocol BinaryDecoder {

    func container() -> BinaryDecodingContainer
}

public protocol BinaryDecodingContainer {

    func decode(_ type: String.Type, length: Int) throws -> String

    func decode<T: FixedWidthInteger>(_ type: T.Type) throws -> T
}
