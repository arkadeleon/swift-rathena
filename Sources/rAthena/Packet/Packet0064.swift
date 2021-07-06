//
//  Packet0064.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/5.
//

public struct Packet0064: Packet {

    public let packetType: UInt16 = 0x0064

    public let packetName: String = "PACKET_CA_LOGIN"

    public let source: PacketEndpoint = .client

    public let destination: PacketEndpoint = .loginServer

    public var version: UInt32

    public var id: String

    public var passwd: String

    public var clientType: UInt8

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
