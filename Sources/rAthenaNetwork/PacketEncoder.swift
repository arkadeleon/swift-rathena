//
//  PacketEncoder.swift
//  rAthena
//
//  Created by Leon Li on 2021/6/28.
//

import Foundation

public class PacketEncoder {

    public let packetVersion: Int
    private let packets: [UInt16 : Packet.Type]

    public init(packetVersion: Int) {
        self.packetVersion = packetVersion
        self.packets = Packets.all(for: packetVersion)
    }

    public func encode(_ packet: Packet) throws -> Data {
        let encoder = BinaryEncoder(packetVersion: packetVersion)
        try packet.encode(to: encoder)
        return encoder.data
    }
}
