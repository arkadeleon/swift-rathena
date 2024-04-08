//
//  PacketEncoder.swift
//  rAthena
//
//  Created by Leon Li on 2021/6/28.
//

import Foundation

public class PacketEncoder {
    public let version: PacketVersion

    public init(version: PacketVersion) {
        self.version = version
    }

    public func encode(_ packet: any PacketProtocol) throws -> Data {
        let encoder = BinaryEncoder(packetVersion: version)
        try packet.encode(to: encoder)
        return encoder.data
    }
}
