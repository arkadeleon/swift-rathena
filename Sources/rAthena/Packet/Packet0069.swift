//
//  Packet0069.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public struct Packet0069: Packet {

    public var authCode: UInt32
    public var aid: UInt32
    public var userLevel: UInt32
    public var lastLoginIP: UInt32
    public var lastLoginTime: String
    public var sex: UInt8
    public var serverList: [ServerInfo]

    public var packetName: String {
        return "PACKET_AC_ACCEPT_LOGIN"
    }

    public var packetType: UInt16 {
        return 0x0069
    }

    public var packetLength: UInt16 {
        return 2 + 2 + 4 + 4 + 4 + 4 + 26 + 1 + ServerInfo.size * UInt16(serverList.count)
    }

    public var source: PacketEndpoint {
        return .loginServer
    }

    public var destination: PacketEndpoint {
        return .client
    }

    public init() {
        self.authCode = 0
        self.aid = 0
        self.userLevel = 0
        self.lastLoginIP = 0
        self.lastLoginTime = ""
        self.sex = 0
        self.serverList = []
    }

    public init(from decoder: BinaryDecoder) throws {
        let packetType = try decoder.decode(UInt16.self)
        guard packetType == 0x0069 else {
            throw PacketDecodingError.packetMismatch(packetType)
        }
        let packetLength = try decoder.decode(UInt16.self)
        let serverCount = (packetLength - 2 - 2 - 4 - 4 - 4 - 4 - 26 - 1) / ServerInfo.size

        self.authCode = try decoder.decode(UInt32.self)
        self.aid = try decoder.decode(UInt32.self)
        self.userLevel = try decoder.decode(UInt32.self)
        self.lastLoginIP = try decoder.decode(UInt32.self)
        self.lastLoginTime = try decoder.decode(String.self, length: 26)
        self.sex = try decoder.decode(UInt8.self)

        self.serverList = []
        for _ in 0..<serverCount {
            let serverInfo = try decoder.decode(ServerInfo.self, length: Int(ServerInfo.size))
            self.serverList.append(serverInfo)
        }
    }

    public func encode(to encoder: BinaryEncoder) throws {
        try encoder.encode(self.packetType)
        try encoder.encode(self.packetLength)
        try encoder.encode(self.authCode)
        try encoder.encode(self.aid)
        try encoder.encode(self.userLevel)
        try encoder.encode(self.lastLoginIP)
        try encoder.encode(self.lastLoginTime, length: 26)
        try encoder.encode(self.sex)
        for serverInfo in self.serverList {
            try encoder.encode(serverInfo, length: Int(ServerInfo.size))
        }
    }
}

extension Packet0069 {

    public struct ServerInfo: BinaryDecodable, BinaryEncodable {

        public var ip: UInt32
        public var port: UInt16
        public var name: String
        public var userCount: UInt16
        public var state: UInt16
        public var property: UInt16

        public static var size: UInt16 {
            return 32
        }

        public init() {
            self.ip = 0
            self.port = 0
            self.name = ""
            self.userCount = 0
            self.state = 0
            self.property = 0
        }

        public init(from decoder: BinaryDecoder) throws {
            self.ip = try decoder.decode(UInt32.self)
            self.port = try decoder.decode(UInt16.self)
            self.name = try decoder.decode(String.self, length: 20)
            self.userCount = try decoder.decode(UInt16.self)
            self.state = try decoder.decode(UInt16.self)
            self.property = try decoder.decode(UInt16.self)
        }

        public func encode(to encoder: BinaryEncoder) throws {
            try encoder.encode(self.ip)
            try encoder.encode(self.port)
            try encoder.encode(self.name, length: 20)
            try encoder.encode(self.userCount)
            try encoder.encode(self.state)
            try encoder.encode(self.property)
        }
    }
}
