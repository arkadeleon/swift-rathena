//
//  PacketDecoder.swift
//  rAthena
//
//  Created by Leon Li on 2021/6/28.
//

public enum PacketDecodingError: Error {

    case unknownPacket(UInt16)
}

public class PacketDecoder {

    public init() {
    }

    public func decode(from data: Data) throws -> Packet {
        let decoder = BinaryDecoder(data: data)
        let packetType = try decoder.decode(UInt16.self)
        guard let packet = Packets.all[packetType] else {
            throw PacketDecodingError.unknownPacket(packetType)
        }
        return try packet.init(from: decoder)
    }
}
