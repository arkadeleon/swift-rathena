//
//  Packet0066.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public struct Packet0066: Packet {

    public var charNum: UInt8

    public var packetName: String {
        return "PACKET_CH_SELECT_CHAR"
    }

    public var packetType: UInt16 {
        return 0x0066
    }

    public var packetLength: UInt16 {
        return 2 + 1
    }

    public var source: PacketEndpoint {
        return .client
    }

    public var destination: PacketEndpoint {
        return .charServer
    }

    public init() {
        self.charNum = 0
    }

    public init(from decoder: BinaryDecoder) throws {
        let packetType = try decoder.decode(UInt16.self)
        guard packetType == 0x0066 else {
            throw PacketDecodingError.packetMismatch(packetType)
        }
        self.charNum = try decoder.decode(UInt8.self)
    }

    public func encode(to encoder: BinaryEncoder) throws {
        try encoder.encode(self.packetType)
        try encoder.encode(self.charNum)
    }
}
