//
//  Packet0067.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public struct Packet0067: Packet {

    public let packetType: UInt16 = 0x0067

    public let packetName: String = "PACKET_CH_MAKE_CHAR"

    public let source: PacketEndpoint = .client

    public let destination: PacketEndpoint = .charServer

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

    public init() {
        name = ""
        str = 0
        agi = 0
        vit = 0
        int = 0
        dex = 0
        luk = 0
        charNum = 0
        headPal = 0
        head = 0
    }

    public init(from decoder: BinaryDecoder) throws {
        name = try decoder.decode(String.self, length: 24)
        str = try decoder.decode(UInt8.self)
        agi = try decoder.decode(UInt8.self)
        vit = try decoder.decode(UInt8.self)
        int = try decoder.decode(UInt8.self)
        dex = try decoder.decode(UInt8.self)
        luk = try decoder.decode(UInt8.self)
        charNum = try decoder.decode(UInt8.self)
        headPal = try decoder.decode(UInt16.self)
        head = try decoder.decode(UInt16.self)
    }

    public func encode(to encoder: BinaryEncoder) throws {
        try encoder.encode(name, length: 24)
        try encoder.encode(str)
        try encoder.encode(agi)
        try encoder.encode(vit)
        try encoder.encode(int)
        try encoder.encode(dex)
        try encoder.encode(luk)
        try encoder.encode(charNum)
        try encoder.encode(headPal)
        try encoder.encode(head)
    }
}
