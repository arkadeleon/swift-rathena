//
//  Packet0068.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public struct Packet0068: Packet {

    public var gid: UInt32
    public var key: String

    public var packetName: String {
        return "PACKET_CH_DELETE_CHAR"
    }

    public var packetType: UInt16 {
        return 0x0068
    }

    public var packetLength: UInt16 {
        return 2 + 4 + 40
    }

    public var source: PacketEndpoint {
        return .client
    }

    public var destination: PacketEndpoint {
        return .charServer
    }

    public init() {
        self.gid = 0
        self.key = ""
    }

    public init(from decoder: BinaryDecoder) throws {
        let packetType = try decoder.decode(UInt16.self)
        guard packetType == 0x0068 else {
            throw PacketDecodingError.packetMismatch(packetType)
        }
        self.gid = try decoder.decode(UInt32.self)
        self.key = try decoder.decode(String.self, length: 40)
    }

    public func encode(to encoder: BinaryEncoder) throws {
        try encoder.encode(self.packetType)
        try encoder.encode(self.gid)
        try encoder.encode(self.key, length: 40)
    }
}
