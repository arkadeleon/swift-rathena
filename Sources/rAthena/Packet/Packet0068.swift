//
//  Packet0068.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public struct Packet0068: Packet {

    public let packetType: UInt16 = 0x0068

    public let packetName: String = "PACKET_CH_DELETE_CHAR"

    public let source: PacketEndpoint = .client

    public let destination: PacketEndpoint = .charServer

    public var gid: UInt32

    public var key: String

    public init() {
        gid = 0
        key = ""
    }

    public init(from decoder: BinaryDecoder) throws {
        gid = try decoder.decode(UInt32.self)
        key = try decoder.decode(String.self, length: 40)
    }

    public func encode(to encoder: BinaryEncoder) throws {
        try encoder.encode(gid)
        try encoder.encode(key, length: 40)
    }
}
