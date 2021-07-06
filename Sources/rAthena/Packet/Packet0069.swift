//
//  Packet0069.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public struct Packet0069: Packet {

    public struct Server: BinaryDecodable, BinaryEncodable {

        public var ip: UInt32

        public var port: UInt16

        public var name: String

        public var userCount: UInt16

        public var state: UInt16

        public var property: UInt16

        public init() {
            ip = 0
            port = 0
            name = ""
            userCount = 0
            state = 0
            property = 0
        }

        public init(from decoder: BinaryDecoder) throws {
            ip = try decoder.decode(UInt32.self)
            port = try decoder.decode(UInt16.self)
            name = try decoder.decode(String.self, length: 20)
            userCount = try decoder.decode(UInt16.self)
            state = try decoder.decode(UInt16.self)
            property = try decoder.decode(UInt16.self)
        }

        public func encode(to encoder: BinaryEncoder) throws {
            try encoder.encode(ip)
            try encoder.encode(port)
            try encoder.encode(name, length: 20)
            try encoder.encode(userCount)
            try encoder.encode(state)
            try encoder.encode(property)
        }
    }

    public let packetType: UInt16 = 0x0069

    public let packetName: String = "PACKET_AC_ACCEPT_LOGIN"

    public let source: PacketEndpoint = .loginServer

    public let destination: PacketEndpoint = .client

    public var authCode: UInt32

    public var aid: UInt32

    public var userLevel: UInt32

    public var lastLoginIP: UInt32

    public var lastLoginTime: String

    public var sex: UInt8

    public var serverList: [Server]

    public init() {
        authCode = 0
        aid = 0
        userLevel = 0
        lastLoginIP = 0
        lastLoginTime = ""
        sex = 0
        serverList = []
    }

    public init(from decoder: BinaryDecoder) throws {
        let packetLength = try decoder.decode(UInt16.self)
        let serverCount = (packetLength - 2 - 2 - 4 - 4 - 4 - 4 - 26 - 1) / 32

        authCode = try decoder.decode(UInt32.self)
        aid = try decoder.decode(UInt32.self)
        userLevel = try decoder.decode(UInt32.self)
        lastLoginIP = try decoder.decode(UInt32.self)
        lastLoginTime = try decoder.decode(String.self, length: 26)
        sex = try decoder.decode(UInt8.self)

        serverList = []
        for _ in 0..<serverCount {
            let server = try Server(from: decoder)
            serverList.append(server)
        }
    }

    public func encode(to encoder: BinaryEncoder) throws {
        let packetLength: UInt16 = 2 + 2 + 4 + 4 + 4 + 4 + 26 + 1 + 32 * UInt16(serverList.count)

        try encoder.encode(packetLength)
        try encoder.encode(authCode)
        try encoder.encode(aid)
        try encoder.encode(userLevel)
        try encoder.encode(lastLoginIP)
        try encoder.encode(lastLoginTime, length: 26)
        try encoder.encode(sex)

        for server in serverList {
            try server.encode(to: encoder)
        }
    }
}
