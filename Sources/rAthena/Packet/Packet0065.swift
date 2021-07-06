//
//  Packet0065.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public struct Packet0065: Packet {

    public var aid: UInt32

    public var authCode: UInt32

    public var userLevel: UInt32

    public var clientType: UInt16

    public var sex: UInt8

    public var packetName: String {
        return "PACKET_CH_ENTER"
    }

    public var packetType: UInt16 {
        return 0x0065
    }

    public var packetLength: UInt16 {
        return 2 + 4 + 4 + 4 + 2 + 1
    }

    public var source: PacketEndpoint {
        return .client
    }

    public var destination: PacketEndpoint {
        return .charServer
    }

    public init() {
        aid = 0
        authCode = 0
        userLevel = 0
        clientType = 0
        sex = 0
    }

    public init(from decoder: BinaryDecoder) throws {
        aid = try decoder.decode(UInt32.self)
        authCode = try decoder.decode(UInt32.self)
        userLevel = try decoder.decode(UInt32.self)
        clientType = try decoder.decode(UInt16.self)
        sex = try decoder.decode(UInt8.self)
    }

    public func encode(to encoder: BinaryEncoder) throws {
        try encoder.encode(aid)
        try encoder.encode(authCode)
        try encoder.encode(userLevel)
        try encoder.encode(clientType)
        try encoder.encode(sex)
    }
}
