//
//  Packet006A.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public struct Packet006A: Packet {

    public var errorCode: UInt8

    public var blockDate: String

    public var packetName: String {
        return "PACKET_AC_REFUSE_LOGIN"
    }

    public var packetType: UInt16 {
        return 0x006A
    }

    public var packetLength: UInt16 {
        return 2 + 1 + 20
    }

    public var source: PacketEndpoint {
        return .loginServer
    }

    public var destination: PacketEndpoint {
        .client
    }
    
    public init() {
        errorCode = 0
        blockDate = ""
    }

    public init(from decoder: BinaryDecoder) throws {
        errorCode = try decoder.decode(UInt8.self)
        blockDate = try decoder.decode(String.self, length: 20)
    }

    public func encode(to encoder: BinaryEncoder) throws {
        try encoder.encode(errorCode)
        try encoder.encode(blockDate, length: 20)
    }
}
