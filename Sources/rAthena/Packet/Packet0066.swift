//
//  Packet0066.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public struct Packet0066: Packet {

    public let packetType: UInt16 = 0x0066

    public let packetName: String = "PACKET_CH_SELECT_CHAR"

    public let source: PacketEndpoint = .client

    public let destination: PacketEndpoint = .charServer

    public var charNum: UInt8

    public init() {
        charNum = 0
    }

    public init(from decoder: BinaryDecoder) throws {
        let container = decoder.container()
        charNum = try container.decode(UInt8.self)
    }

    public func encode(to encoder: BinaryEncoder) throws {
        let container = encoder.container()
        try container.encode(charNum)
    }
}
