//
//  PacketEncoder.swift
//  rAthena
//
//  Created by Leon Li on 2021/6/28.
//

public class PacketEncoder {

    public init() {
    }

    public func encode(_ packet: Packet) throws -> Data {
        let encoder = _PacketEncoder()
        try encoder.encode(packet.packetType)
        try packet.encode(to: encoder)
        return encoder.data
    }
}

public enum PacketEncodingError: Error {

    case cannotConvertFromString
}

private class _PacketEncoder: BinaryEncoder {

    var data = Data()

    func encode(_ value: String, length: Int) throws {
        if var data = value.data(using: .utf8), data.count <= length {
            data.append(contentsOf: [UInt8](repeating: 0, count: length - data.count))
            self.data.append(data)
        } else {
            throw PacketEncodingError.cannotConvertFromString
        }
    }

    func encode<T: FixedWidthInteger>(_ value: T) throws {
        let bytes = withUnsafeBytes(of: value, Array<UInt8>.init)
        self.data.append(contentsOf: bytes)
    }
}
