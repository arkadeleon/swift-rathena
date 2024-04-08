//
//  BinaryDecoder.swift
//  rAthena
//
//  Created by Leon Li on 2021/6/28.
//

import Foundation

public protocol BinaryDecodable {
    init(from decoder: BinaryDecoder) throws
}

public enum BinaryDecodingError: Error {
    case dataCorrupted
}

public class BinaryDecoder {
    internal var data: Data
    internal let packetVersion: PacketVersion

    internal init(data: Data, packetVersion: PacketVersion) {
        self.data = data
        self.packetVersion = packetVersion
    }

    func decode<T: FixedWidthInteger>(_ type: T.Type) throws -> T {
        let length = type.bitWidth / 8
        let data = self.data.prefix(length)
        guard data.count == length else {
            throw BinaryDecodingError.dataCorrupted
        }

        self.data.removeFirst(length)

        let values = data.withUnsafeBytes { pointer in
            pointer.bindMemory(to: type)
        }
        return values[0]
    }

    func decode(_ type: [UInt8].Type, length: Int) throws -> [UInt8] {
        let data = self.data.prefix(length)
        guard data.count == length else {
            throw BinaryDecodingError.dataCorrupted
        }

        self.data.removeFirst(length)

        let bytes = [UInt8](data)
        return bytes
    }

    func decode(_ type: String.Type, length: Int) throws -> String {
        let data = self.data.prefix(length)
        guard data.count == length else {
            throw BinaryDecodingError.dataCorrupted
        }

        self.data.removeFirst(length)

        guard let string = String(data: data, encoding: .utf8) else {
            throw BinaryDecodingError.dataCorrupted
        }
        return string
    }

    func decode<T: BinaryDecodable>(_ type: T.Type) throws -> T {
        let value = try type.init(from: self)
        return value
    }

    func decode<T: BinaryDecodable>(_ type: T.Type, length: Int) throws -> T {
        let data = self.data.prefix(length)
        guard data.count == length else {
            throw BinaryDecodingError.dataCorrupted
        }

        self.data.removeFirst(length)

        let decoder = BinaryDecoder(data: data, packetVersion: packetVersion)
        let value = try type.init(from: decoder)
        return value
    }
}
