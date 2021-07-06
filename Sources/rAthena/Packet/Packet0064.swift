//
//  Packet0064.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/5.
//

public struct Packet0064: Packet {

    public var version: UInt32

    public var id: String

    public var passwd: String

    public var clientType: UInt8

    public var packetName: String {
        return "PACKET_CA_LOGIN"
    }

    public var packetType: UInt16 {
        return 0x0064
    }

    public var packetLength: UInt16 {
        return 2 + 4 + 24 + 24 + 1
    }

    public var source: PacketEndpoint {
        return .client
    }

    public var destination: PacketEndpoint {
        return .loginServer
    }

    public init() {
        version = 0
        id = ""
        passwd = ""
        clientType = 0
    }

    public init(from decoder: BinaryDecoder) throws {
        version = try decoder.decode(UInt32.self)
        id = try decoder.decode(String.self, length: 24)
        passwd = try decoder.decode(String.self, length: 24)
        clientType = try decoder.decode(UInt8.self)
    }

    public func encode(to encoder: BinaryEncoder) throws {
        try encoder.encode(version)
        try encoder.encode(id, length: 24)
        try encoder.encode(passwd, length: 24)
        try encoder.encode(clientType)
    }
}
