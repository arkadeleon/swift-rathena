//
//  PacketDecoder.swift
//  rAthena
//
//  Created by Leon Li on 2021/6/28.
//

public class PacketDecoder {

    public init() {
    }

    public func decode(from data: Data) throws -> Packet {
        let decoder = _PacketDecoder(data: data)
        let container = decoder.container()
        let packetType = try container.decode(UInt16.self)
        guard let packet = Packets.all[packetType] else {
            throw PacketDecodingError.unknownPacket
        }
        return try packet.init(from: decoder)
    }
}

public enum PacketDecodingError: Error {

    case cannotConvertToString
    case dataCorrupted
    case unknownPacket
}

private class _PacketDecoder: BinaryDecoder {

    var data: Data

    init(data: Data) {
        self.data = data
    }

    func container() -> BinaryDecodingContainer {
        return _PacketDecodingContainer(decoder: self)
    }
}

private class _PacketDecodingContainer: BinaryDecodingContainer {

    let decoder: _PacketDecoder

    init(decoder: _PacketDecoder) {
        self.decoder = decoder
    }

    func decode(_ type: String.Type, length: Int) throws -> String {
        let data = decoder.data.prefix(length)
        if data.count != length {
            throw PacketDecodingError.dataCorrupted
        }

        decoder.data.removeFirst(length)

        if let string = String(data: data, encoding: .utf8) {
            return string
        } else {
            throw PacketDecodingError.cannotConvertToString
        }
    }

    func decode<T: FixedWidthInteger>(_ type: T.Type) throws -> T {
        let length = type.bitWidth / 8
        let data = decoder.data.prefix(length)
        if data.count != length {
            throw PacketDecodingError.dataCorrupted
        }

        decoder.data.removeFirst(length)

        let values = data.withUnsafeBytes { pointer in
            pointer.bindMemory(to: type)
        }
        return values[0]
    }
}
