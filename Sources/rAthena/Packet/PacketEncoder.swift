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
        let container = encoder.container()
        try container.encode(packet.packetType)
        try packet.encode(to: encoder)
        return encoder.data
    }
}

public enum PacketEncodingError: Error {

    case cannotConvertFromString
}

private class _PacketEncoder: BinaryEncoder {

    var data = Data()

    func container() -> BinaryEncodingContaner {
        return _PacketEncodingContainer(encoder: self)
    }
}

private class _PacketEncodingContainer: BinaryEncodingContaner {

    let encoder: _PacketEncoder

    init(encoder: _PacketEncoder) {
        self.encoder = encoder
    }

    func encode(_ value: String, length: Int) throws {
        if var data = value.data(using: .utf8), data.count <= length {
            data.append(contentsOf: [UInt8](repeating: 0, count: length - data.count))
            encoder.data.append(data)
        } else {
            throw PacketEncodingError.cannotConvertFromString
        }
    }

    func encode<T: FixedWidthInteger>(_ value: T) throws {
        let bytes = withUnsafeBytes(of: value, Array<UInt8>.init)
        encoder.data.append(contentsOf: bytes)
    }
}
