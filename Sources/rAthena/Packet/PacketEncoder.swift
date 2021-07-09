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
        let encoder = BinaryEncoder()
        try encoder.encode(packet.packetType)
        try packet.encode(to: encoder)
        return encoder.data
    }
}
