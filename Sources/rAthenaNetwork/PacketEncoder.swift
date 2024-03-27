//
//  PacketEncoder.swift
//  rAthena
//
//  Created by Leon Li on 2021/6/28.
//

import Foundation

public class PacketEncoder {

    public let packetVersion: Int

    public init(packetVersion: Int) {
        self.packetVersion = packetVersion
    }

    public func encode(_ packet: any Packet) throws -> Data {
        let encoder = BinaryEncoder(packetVersion: packetVersion)
        try packet.encode(to: encoder)
        return encoder.data
    }
}
