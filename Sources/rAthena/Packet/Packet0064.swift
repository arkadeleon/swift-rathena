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
        self.version = 0
        self.id = ""
        self.passwd = ""
        self.clientType = 0
    }

    public init(from decoder: BinaryDecoder) throws {
        let packetType = try decoder.decode(UInt16.self)
        guard packetType == 0x0064 else {
            throw PacketDecodingError.packetMismatch(packetType)
        }
        self.version = try decoder.decode(UInt32.self)
        self.id = try decoder.decode(String.self, length: 24)
        self.passwd = try decoder.decode(String.self, length: 24)
        self.clientType = try decoder.decode(UInt8.self)
    }

    public func encode(to encoder: BinaryEncoder) throws {
        try encoder.encode(self.packetType)
        try encoder.encode(self.version)
        try encoder.encode(self.id, length: 24)
        try encoder.encode(self.passwd, length: 24)
        try encoder.encode(self.clientType)
    }
}
