//
//  Packet0067.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public struct Packet0067: Packet {

    public var name: String
    public var str: UInt8
    public var agi: UInt8
    public var vit: UInt8
    public var int: UInt8
    public var dex: UInt8
    public var luk: UInt8
    public var charNum: UInt8
    public var headPal: UInt16
    public var head: UInt16

    public var packetName: String {
        return "PACKET_CH_MAKE_CHAR"
    }

    public var packetType: UInt16 {
        return 0x0067
    }

    public var packetLength: UInt16 {
        return 2 + 24 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 2 + 2
    }

    public var source: PacketEndpoint {
        return .client
    }

    public var destination: PacketEndpoint {
        return .charServer
    }

    public init() {
        self.name = ""
        self.str = 0
        self.agi = 0
        self.vit = 0
        self.int = 0
        self.dex = 0
        self.luk = 0
        self.charNum = 0
        self.headPal = 0
        self.head = 0
    }

    public init(from decoder: BinaryDecoder) throws {
        let packetType = try decoder.decode(UInt16.self)
        guard packetType == 0x0067 else {
            throw PacketDecodingError.packetMismatch(packetType)
        }
        self.name = try decoder.decode(String.self, length: 24)
        self.str = try decoder.decode(UInt8.self)
        self.agi = try decoder.decode(UInt8.self)
        self.vit = try decoder.decode(UInt8.self)
        self.int = try decoder.decode(UInt8.self)
        self.dex = try decoder.decode(UInt8.self)
        self.luk = try decoder.decode(UInt8.self)
        self.charNum = try decoder.decode(UInt8.self)
        self.headPal = try decoder.decode(UInt16.self)
        self.head = try decoder.decode(UInt16.self)
    }

    public func encode(to encoder: BinaryEncoder) throws {
        try encoder.encode(self.packetType)
        try encoder.encode(self.name, length: 24)
        try encoder.encode(self.str)
        try encoder.encode(self.agi)
        try encoder.encode(self.vit)
        try encoder.encode(self.int)
        try encoder.encode(self.dex)
        try encoder.encode(self.luk)
        try encoder.encode(self.charNum)
        try encoder.encode(self.headPal)
        try encoder.encode(self.head)
    }
}
