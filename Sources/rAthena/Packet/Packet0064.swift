//
//  Packet0064.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/5.
//

public struct Packet0064: Packet {

    public var version: UInt32 = 0

    public var id: String = ""

    public var passwd: String = ""

    public var clientType: UInt8 = 0

    public var packetType: UInt16 {
        return 0x0064
    }

    public var packetName: String {
        return "PACKET_CA_LOGIN"
    }

    public var source: PacketEndpoint {
        return .client
    }

    public var destination: PacketEndpoint {
        return .loginServer
    }

    public init() {
    }

    public init(from decoder: BinaryDecoder) throws {
        let container = decoder.container()
        version = try container.decode(UInt32.self)
        id = try container.decode(String.self, length: 24)
        passwd = try container.decode(String.self, length: 24)
        clientType = try container.decode(UInt8.self)
    }

    public func encode(to encoder: BinaryEncoder) throws {
        let container = encoder.container()
        try container.encode(version)
        try container.encode(id, length: 24)
        try container.encode(passwd, length: 24)
        try container.encode(clientType)
    }
}
