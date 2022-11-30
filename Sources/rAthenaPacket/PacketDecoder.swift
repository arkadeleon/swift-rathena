//
//  PacketDecoder.swift
//  rAthena
//
//  Created by Leon Li on 2021/6/28.
//

import Foundation

public enum PacketDecodingError: Error {

    case packetMismatch(UInt16)
    case unknownPacket(UInt16)
}

public class PacketDecoder {

    public init() {
    }

    public func decode(from data: Data) throws -> Packet {
        let packetTypeDecoder = BinaryDecoder(data: data)
        let packetType = try packetTypeDecoder.decode(UInt16.self)
        guard let packet = Packets.all[packetType] else {
            throw PacketDecodingError.unknownPacket(packetType)
        }
        let decoder = BinaryDecoder(data: data)
        return try packet.init(from: decoder)
    }
}
